# Raw video capture

Results gathered here are for raw video capture.


## RESOLUTION=320x240, BATCHSIZE=N_CAMERAS
```
v4l2src width=320,height=240; batch=1
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.011 ~ 0.067   0.011 ~ 0.067                                                      :: m_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: nvinfer0_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: nvmultistreamtiler0_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: nvdsosd0_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: fakesink0_sink
perf: fps_fakesink; timestamp: 72:43:44.900523892; bps: 15360.000; mean_bps: 14272.000; fps: 29.928; mean_fps: 33.242
perf: fps_cam_m.sink_0; timestamp: 72:43:45.164028385; bps: 15360.000; mean_bps: 15652.571; fps: 29.876; mean_fps: 29.962


v4l2src width=320,height=240; batch=2
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.013 ~ 0.077   0.009 ~ 0.061   0.393 ~ 0.234                                      :: m_src
0.023 ~ 0.087   0.016 ~ 0.065   0.437 ~ 0.205                                      :: nvinfer0_src
0.023 ~ 0.087   0.016 ~ 0.065   0.438 ~ 0.205                                      :: nvmultistreamtiler0_src
0.023 ~ 0.087   0.016 ~ 0.065   0.438 ~ 0.205                                      :: nvdsosd0_src
0.023 ~ 0.087   0.016 ~ 0.065   0.438 ~ 0.205                                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 72:44:36.994316845; bps: 15360.000; mean_bps: 15744.000; fps: 29.903; mean_fps: 29.520
perf: fps_cam_m.sink_1; timestamp: 72:44:37.225637785; bps: 15360.000; mean_bps: 15360.000; fps: 29.997; mean_fps: 29.973
perf: fps_fakesink; timestamp: 72:44:37.967808264; bps: 15360.000; mean_bps: 13312.000; fps: 29.881; mean_fps: 34.310


v4l2src width=320,height=240; batch=3
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.020 ~ 0.107   0.448 ~ 0.209   0.003 ~ 0.039   0.620 ~ 0.141                      :: m_src
0.028 ~ 0.104   0.467 ~ 0.199   0.015 ~ 0.053   0.663 ~ 0.140                      :: nvinfer0_src
0.028 ~ 0.104   0.467 ~ 0.199   0.015 ~ 0.053   0.663 ~ 0.140                      :: nvmultistreamtiler0_src
0.028 ~ 0.104   0.468 ~ 0.199   0.015 ~ 0.053   0.664 ~ 0.139                      :: nvdsosd0_src
0.028 ~ 0.104   0.468 ~ 0.199   0.015 ~ 0.053   0.664 ~ 0.139                      :: fakesink0_sink
perf: fps_cam_m.sink_2; timestamp: 72:45:25.393177567; bps: 15360.000; mean_bps: 15303.111; fps: 29.999; mean_fps: 29.969
perf: fps_cam_m.sink_1; timestamp: 72:45:26.062536470; bps: 15360.000; mean_bps: 15303.111; fps: 29.976; mean_fps: 29.504
perf: fps_cam_m.sink_0; timestamp: 72:45:26.095557712; bps: 15360.000; mean_bps: 15303.111; fps: 29.952; mean_fps: 29.749
perf: fps_fakesink; timestamp: 72:45:26.141285477; bps: 15360.000; mean_bps: 13721.600; fps: 29.799; mean_fps: 32.330


v4l2src width=320,height=240; batch=4
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.025 ~ 0.134   0.404 ~ 0.173   0.002 ~ 0.030   0.944 ~ 0.192   0.725 ~ 0.210      :: m_src
0.038 ~ 0.140   0.427 ~ 0.180   0.015 ~ 0.039   1.017 ~ 0.141   0.749 ~ 0.198      :: nvinfer0_src
0.038 ~ 0.140   0.428 ~ 0.180   0.015 ~ 0.039   1.017 ~ 0.141   0.749 ~ 0.198      :: nvmultistreamtiler0_src
0.038 ~ 0.140   0.428 ~ 0.180   0.015 ~ 0.040   1.017 ~ 0.141   0.749 ~ 0.198      :: nvdsosd0_src
0.038 ~ 0.140   0.428 ~ 0.180   0.015 ~ 0.040   1.017 ~ 0.141   0.749 ~ 0.198      :: fakesink0_sink
perf: fps_cam_m.sink_1; timestamp: 72:46:54.404209016; bps: 15360.000; mean_bps: 14592.000; fps: 29.992; mean_fps: 29.947
perf: fps_cam_m.sink_3; timestamp: 72:46:55.208378443; bps: 15360.000; mean_bps: 14701.714; fps: 29.899; mean_fps: 29.448
perf: fps_cam_m.sink_0; timestamp: 72:46:55.208510258; bps: 15360.000; mean_bps: 14701.714; fps: 29.935; mean_fps: 29.321
perf: fps_cam_m.sink_2; timestamp: 72:46:55.208674109; bps: 15360.000; mean_bps: 15067.429; fps: 29.932; mean_fps: 29.633
perf: fps_fakesink; timestamp: 72:46:55.221505247; bps: 15360.000; mean_bps: 12864.000; fps: 29.859; mean_fps: 33.675
```


## RESOLUTION=320x240, BATCHSIZE=1
```
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.011 ~ 0.067   0.011 ~ 0.067                                                      :: m_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: nvinfer0_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: nvmultistreamtiler0_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: nvdsosd0_src
0.016 ~ 0.073   0.016 ~ 0.073                                                      :: fakesink0_sink


v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.007 ~ 0.044   0.007 ~ 0.043   0.006 ~ 0.045                                      :: m_src
0.011 ~ 0.050   0.008 ~ 0.037   0.012 ~ 0.055                                      :: nvinfer0_src
0.011 ~ 0.050   0.008 ~ 0.037   0.013 ~ 0.055                                      :: nvmultistreamtiler0_src
0.011 ~ 0.050   0.008 ~ 0.037   0.013 ~ 0.055                                      :: nvdsosd0_src
0.011 ~ 0.050   0.008 ~ 0.037   0.013 ~ 0.055                                      :: fakesink0_sink


v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.007 ~ 0.044   0.012 ~ 0.059   0.002 ~ 0.019   0.007 ~ 0.040                      :: m_src
0.011 ~ 0.046   0.016 ~ 0.063   0.005 ~ 0.019   0.010 ~ 0.039                      :: nvinfer0_src
0.011 ~ 0.046   0.016 ~ 0.063   0.005 ~ 0.019   0.010 ~ 0.039                      :: nvmultistreamtiler0_src
0.011 ~ 0.046   0.016 ~ 0.063   0.005 ~ 0.019   0.011 ~ 0.039                      :: nvdsosd0_src
0.011 ~ 0.046   0.016 ~ 0.063   0.005 ~ 0.019   0.011 ~ 0.039                      :: fakesink0_sink


v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.006 ~ 0.037   0.000 ~ 0.000   0.003 ~ 0.013   0.008 ~ 0.050   0.012 ~ 0.046      :: m_src
0.010 ~ 0.042   0.003 ~ 0.001   0.005 ~ 0.008   0.014 ~ 0.062   0.013 ~ 0.036      :: nvinfer0_src
0.010 ~ 0.042   0.004 ~ 0.001   0.005 ~ 0.008   0.015 ~ 0.062   0.014 ~ 0.036      :: nvmultistreamtiler0_src
0.010 ~ 0.042   0.004 ~ 0.001   0.006 ~ 0.008   0.015 ~ 0.062   0.014 ~ 0.036      :: nvdsosd0_src
0.010 ~ 0.042   0.004 ~ 0.001   0.006 ~ 0.008   0.015 ~ 0.062   0.014 ~ 0.036      :: fakesink0_sink
```


## RESOLUTION=HIGHEST, BATCHSIZE=N_CAMERAS

```
v4l2src width=1920,height=1080
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.020 ~ 0.030   0.020 ~ 0.030                                                      :: m_src
0.029 ~ 0.072   0.029 ~ 0.072                                                      :: nvinfer0_src
0.029 ~ 0.072   0.029 ~ 0.072                                                      :: nvmultistreamtiler0_src
0.029 ~ 0.072   0.029 ~ 0.072                                                      :: nvdsosd0_src
0.029 ~ 0.072   0.029 ~ 0.072                                                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:54:29.795679700; bps: 2560.000; mean_bps: 1365.333; fps: 4.770; mean_fps: 4.812
perf: fps_fakesink; timestamp: 73:54:30.639171437; bps: 2560.000; mean_bps: 1331.200; fps: 4.751; mean_fps: 6.322


# more than 2 cameras cant run at a resolution higher than 320x240
```

