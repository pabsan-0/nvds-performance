# NVDS-Performance

This repo holds an interface to benchmark FPS and latency of Deepstream pipelines. These files have two purposes:

- To store an arbitrarliy configured pipeline benchmarking for reference
- To serve as boilerplate or reference examples to analyze pipeline performance

The pipelines in here are not optimized and are meant for comparison only.

[TOC]

## Setup

This repo was built on this setup:

- NVDS 6.1 Ubuntu docker
- Capture from USB 2.0 v4l2 cameras 1920x1080 (x4)
- Inference Yolov5n at 640x640px

Dependencies:

- Nvidia Deepstream (`nvinfer` prepared beforehand)
- GstShark
- GstPerf

Should run out of the box on [NVDS-Lite](https://bitbucket.org/fadacatec-ondemand/nvds-lite/src/master/) environment.

## Sample pipelines

Three directories are included in here, each holding the same pipeline with a different number of input sources.

- [x-raw](https://bitbucket.org/fadacatec-ondemand/nvds-performance/src/master/x-raw/): these pipelines grab frames uncompressed, as raw video
- [jpeg](https://bitbucket.org/fadacatec-ondemand/nvds-performance/src/master/jpeg/): these pipelines grab frames in compressed jpeg format
- [jpeg-sync](https://bitbucket.org/fadacatec-ondemand/nvds-performance/src/master/jpeg-sync/): these pipelines grab frames in compressed jpeg format and then force `nvdsmux` to sync all cameras before batching

See the benchmarking results for these in their respective folders.

## Testing interface

**WARNING:** These are developer's tools filled with unsafe practices (such as running shell commands from regex-overwritten strings). Nothing bad should happen with the default scripts, but do pay attention if you start modifying files.

The testing interface consists on bash scripts which parse pipelines and `sed`-replace elements in them. Some of these replacements include:

- Defaulting the sink to `fakesink`, as nvidia sinks don't play well with benchmarking tools
- Defining environment variables related to debugging output
- Pipe pipeline outputs to logs to be parsed later

Cameras `/dev/videoX` locations are defined in the `devices.cfg` file. Check yours with `v4l2-ctl --list-devices`

After you're all set:

- Play pipeline to display: `./display jpeg/x1-v4l2-yolov5-fakesink.bash`
- Measure fps: `./fps jpeg/x1-v4l2-yolov5-fakesink.bash`
- Measure interlatency (interactive plot): `./latency jpeg/x1-v4l2-yolov5-fakesink.bash`
- Measure interlatency (results table): `./latency-scripted jpeg/x1-v4l2-yolov5-fakesink.bash`

## Output interpretation

### Interlatency

The following is an interlatency table. It marks the time in seconds a buffer takes to arrive from each source (column) to each checkpoint (row). Such time is sampled at many moments, hence the table shows it in format `average ~ stddev`. Each indexed source (`v4l2src0_src`) is a camera. The unnumbered `v4l2src` column averages all other sources.

```
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.040 ~ 0.063   0.056 ~ 0.001   0.039 ~ 0.058   0.403 ~ 0.341                      :: m_src
0.050 ~ 0.073   0.066 ~ 0.000   0.047 ~ 0.056   0.507 ~ 0.367                      :: nvinfer0_src
0.050 ~ 0.073   0.066 ~ 0.000   0.047 ~ 0.056   0.507 ~ 0.367                      :: nvmultistreamtiler0_src
0.051 ~ 0.073   0.066 ~ 0.000   0.048 ~ 0.056   0.508 ~ 0.367                      :: nvdsosd0_src
0.051 ~ 0.073   0.066 ~ 0.000   0.048 ~ 0.056   0.508 ~ 0.367                      :: fakesink0_sink
```

Some example observations to be made on this table:

- The setup being examined is for three cameras: `v4l2src0_src`, `v4l2src1_src` & `v4l2src2_src`.
- There is room for one more camera `v4l2src3_src`, which is not being used in this pipeline.
- Looking at `v4l2src0_src `:
    - It takes 0.056s to capture a frame from it
    - It takes an additional 0.08s to infer it on average (along with the other frames in the batch)
    - After inference, the rest of the pipeline runs instantly
- Not all cameras show the same end to end latency:
    - This is because syncing is not being enforced
    - This happens because buffers from a camera are being dropped at some queue, so only one every x buffer arrives at the end of the pipeline
- The average `v4l2src` does not match the average of all cameras
    - For the reasons described above, there are many more sampled end-to-end times for the faster cameras
    - This means the average computation is strongly biased
    - This average cannot be trusted in the unbalanced case

One should expect a significant latency increase if `fakesink` is not used and the video is being displayed on screen.


### FPS

FPS can be measured at any point in the pipeline. They come as labelled rows and are straightforward to read.

```
perf: fps_fakesink; timestamp: 72:43:44.900523892; bps: 15360.000; mean_bps: 14272.000; fps: 29.928; mean_fps: 33.242
perf: fps_cam_m.sink_0; timestamp: 72:43:45.164028385; bps: 15360.000; mean_bps: 15652.571; fps: 29.876; mean_fps: 29.962
```


## Relevant notes

- Average latency results are only reliable in case of balanced latency, else they are biased by leakage
- Sources getting NaN latencies have seen to be related to excessive queue leakage
- nvv4l2dec has a `max-performance` param in some hardware. Use it if available
- USB cameras may be latency-unbalanced if syncing is not enforced
- Uneven batchsizes can be more efficient if capture is slow (x-raw), for example n_cameras=2 & batch=1
- Too many usb cameras will make the USB driver fail to allocate memory (>2)
    - Reference + tegra fix: https://forums.developer.nvidia.com/t/use-gstreamer-to-open-two-usb-cameras-failed-to-allocate-required-memory/122843
    - Lowering image resolution will ease this issue
    - Connecting some of the cameras through different usb interfaces will also do the trick sometimes
    - Some pipelines may run *just* sometimes with no modifications if close to the memory limit

## Convenient extra tools

A compendium of tools or references found useful during these experiments.

- Usb list: `lsusb -t`
- Usb bandwith monitor: `modprobe usbmon` `sudo usbmon`
- Camera device list `v4l2-ctl --list-devices`
- Show device caps `v4l2-ctl -d /dev/video0 --list-formats-ext`
- Monitor GPU usage `nvidia-smi` or `jtop` (jetson)
- Gstreamer's [debugging tools docs](https://gstreamer.freedesktop.org/documentation/tutorials/basic/debugging-tools.html?gi-language=c)
- Jetson only overclocking:
    ```
    $ sudo nvpmodel -m <mode> # for MAX perf and power, mode is 0 and for NX set to 8
    $ sudo jetson_clocks
    ```

