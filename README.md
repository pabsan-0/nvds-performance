# NVDS-Performance

This repo holds an interface to benchmark FPS and latency of Deepstream pipelines. These files have two purposes:

- To store an arbitrarliy configured pipeline benchmarking for reference
- To serve as boilerplate or reference examples to analyze pipeline performance

The pipelines in here are not optimized and are meant for comparison only

## Setup

This repo was built on this setup:
- (x4) USB 2.0 v4l2 cameras 1920x1080
- NVDS 6.1 Ubuntu docker

Dependencies:

- Nvidia Deepstream (`nvinfer` prepared beforehand)
- GstShark
- GstPerf

Should run out of the box on [NVDS-Lite](https://bitbucket.org/fadacatec-ondemand/nvds-lite/src/master/) environment.

## Default pipelines

Three directories are included in here, each holding the same pipeline with a different number of input sources.

- `x-raw`: these pipelines grab frames uncompressed, as raw video
- `jpeg`: these pipelines grab frames in compressed jpeg format
- `jpeg-sync`: these pipelines grab frames in compressed jpeg format and then force `nvdsmux` to sync all cameras before batching

## Testing interface

**WARNING:** These are developer's tools filled with unsafe practices (such as running shell commands from regex-overwritten strings). Nothing bad should happen with the default scripts, but do pay attention if you start modifying files.

The testing interface consists on bash scripts which parse pipelines and `sed`-replace elements in them. Some of these replacements include:

- Defaulting the sink to `fakesink`, as nvidia sinks don't play well with benchmarking tools
- Defining environment variables related to debugging output
- Pipe pipeline outputs to logs to be parsed later
- etc.

Cameras `/dev/videoX` locations are defined in the `devices.cfg` file. Check yours with `v4l2-ctl --list-devices`

After you're all set:

- Play pipeline to display: `./display jpeg/x1-v4l2-yolov5-fakesink.bash`
- Measure fps: `./fps jpeg/x1-v4l2-yolov5-fakesink.bash`
- Measure interlatency (interactive plot): `./latency jpeg/x1-v4l2-yolov5-fakesink.bash`
- Measure interlatency (results table): `./latency-scripted jpeg/x1-v4l2-yolov5-fakesink.bash`


## Relevant notes

- Average latency results are only reliable in case of balanced latency, else they are biased by leakage
- nvv4l2dec has a `max-performance` param in some hardware. Use it if available
- Sources getting NaN latencies have seen to be related to excessive queue leakage
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