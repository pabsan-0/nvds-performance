# jpeg
```
v4l2src width=320,height=240
queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0
nvstreammux name=m batch-size=1 width=640 height=640 nvbuf-memory-type=0
```

## BATCHSIZE = N_CAMERAS
```
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.038 ~ 0.044   0.038 ~ 0.044                                                      :: m_src
0.043 ~ 0.053   0.043 ~ 0.053                                                      :: nvinfer0_src
0.043 ~ 0.053   0.043 ~ 0.053                                                      :: nvmultistreamtiler0_src
0.043 ~ 0.053   0.043 ~ 0.053                                                      :: nvdsosd0_src
0.043 ~ 0.053   0.043 ~ 0.053                                                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 72:58:00.539535147; bps: 15360.000; mean_bps: 14976.000; fps: 30.035; mean_fps: 28.794
perf: fps_fakesink; timestamp: 72:58:01.210340378; bps: 15360.000; mean_bps: 13772.800; fps: 30.061; mean_fps: 31.169

v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.039 ~ 0.064   0.349 ~ 0.402   0.036 ~ 0.040                                      :: m_src
0.047 ~ 0.070   0.217 ~ 0.342   0.046 ~ 0.063                                      :: nvinfer0_src
0.047 ~ 0.070   0.218 ~ 0.341   0.046 ~ 0.063                                      :: nvmultistreamtiler0_src
0.047 ~ 0.070   0.218 ~ 0.341   0.046 ~ 0.063                                      :: nvdsosd0_src
0.047 ~ 0.070   0.218 ~ 0.341   0.046 ~ 0.063                                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 72:58:32.723055964; bps: 15360.000; mean_bps: 14528.000; fps: 30.041; mean_fps: 27.982
perf: fps_cam_m.sink_1; timestamp: 72:58:32.920895537; bps: 15360.000; mean_bps: 14677.333; fps: 29.998; mean_fps: 28.788
perf: fps_fakesink; timestamp: 72:58:33.696973136; bps: 15360.000; mean_bps: 13414.400; fps: 30.038; mean_fps: 31.239

v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.039 ~ 0.053   0.055 ~ 0.002   0.056 ~ 0.010   0.038 ~ 0.054                      :: m_src
0.050 ~ 0.070   0.538 ~ 0.467   0.071 ~ 0.012   0.048 ~ 0.061                      :: nvinfer0_src
0.050 ~ 0.070   0.538 ~ 0.467   0.071 ~ 0.012   0.049 ~ 0.061                      :: nvmultistreamtiler0_src
0.050 ~ 0.070   0.541 ~ 0.465   0.071 ~ 0.012   0.049 ~ 0.061                      :: nvdsosd0_src
0.050 ~ 0.070   0.541 ~ 0.465   0.071 ~ 0.012   0.049 ~ 0.061                      :: fakesink0_sink
perf: fps_cam_m.sink_2; timestamp: 72:59:01.731822960; bps: 15360.000; mean_bps: 13056.000; fps: 30.000; mean_fps: 26.595
perf: fps_cam_m.sink_1; timestamp: 72:59:01.929885267; bps: 15360.000; mean_bps: 13926.400; fps: 29.883; mean_fps: 27.956
perf: fps_cam_m.sink_0; timestamp: 72:59:02.669812282; bps: 15360.000; mean_bps: 13414.400; fps: 30.000; mean_fps: 26.774
perf: fps_fakesink; timestamp: 72:59:02.678997342; bps: 15360.000; mean_bps: 11605.333; fps: 29.995; mean_fps: 32.255

v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.038 ~ 0.051   0.067 ~ 0.000   0.038 ~ 0.051   0.106 ~ 0.005   0.036 ~ 0.000      :: m_src
0.053 ~ 0.077   0.705 ~ 0.621   0.050 ~ 0.051   0.127 ~ 0.004   0.562 ~ 0.515      :: nvinfer0_src
0.053 ~ 0.077   0.705 ~ 0.621   0.050 ~ 0.051   0.127 ~ 0.004   0.562 ~ 0.515      :: nvmultistreamtiler0_src
0.054 ~ 0.077   0.706 ~ 0.621   0.051 ~ 0.051   0.128 ~ 0.004   0.563 ~ 0.515      :: nvdsosd0_src
0.054 ~ 0.077   0.706 ~ 0.621   0.051 ~ 0.051   0.128 ~ 0.004   0.563 ~ 0.515      :: fakesink0_sink
perf: fps_cam_m.sink_2; timestamp: 72:59:39.953713486; bps: 15360.000; mean_bps: 13141.333; fps: 30.052; mean_fps: 26.664
perf: fps_cam_m.sink_0; timestamp: 72:59:39.959898087; bps: 15360.000; mean_bps: 13056.000; fps: 29.926; mean_fps: 26.527
perf: fps_cam_m.sink_1; timestamp: 72:59:40.020437970; bps: 15360.000; mean_bps: 13482.667; fps: 29.872; mean_fps: 26.989
perf: fps_cam_m.sink_3; timestamp: 72:59:40.249989152; bps: 15360.000; mean_bps: 13482.667; fps: 29.921; mean_fps: 28.194
perf: fps_fakesink; timestamp: 72:59:40.941788877; bps: 15360.000; mean_bps: 12032.000; fps: 29.914; mean_fps: 31.713
```

