# jpeg-sync
```
v4l2src width=320,height=240
queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0
nvstreammux name=m batch-size=1 width=640 height=640 nvbuf-memory-type=0
```

## BATCHSIZE = N_CAMERAS
```
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.047 ~ 0.009   0.048 ~ 0.008   0.036 ~ 0.005                                      :: m_src
0.053 ~ 0.028   0.055 ~ 0.029   0.041 ~ 0.006                                      :: nvinfer0_src
0.054 ~ 0.028   0.055 ~ 0.029   0.041 ~ 0.006                                      :: nvmultistreamtiler0_src
0.054 ~ 0.028   0.056 ~ 0.029   0.041 ~ 0.006                                      :: nvdsosd0_src
0.054 ~ 0.028   0.056 ~ 0.029   0.041 ~ 0.006                                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:07:00.323413372; bps: 15360.000; mean_bps: 14592.000; fps: 30.040; mean_fps: 28.043
perf: fps_cam_m.sink_1; timestamp: 73:07:00.521308302; bps: 15360.000; mean_bps: 14720.000; fps: 29.992; mean_fps: 29.285
perf: fps_fakesink;     timestamp: 73:07:01.045134259; bps: 15360.000; mean_bps: 12714.667; fps: 29.998; mean_fps: 32.232

v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.045 ~ 0.008   0.047 ~ 0.008   0.036 ~ 0.005   0.036 ~ 0.002                      :: m_src
0.054 ~ 0.026   0.057 ~ 0.029   0.044 ~ 0.006   0.043 ~ 0.003                      :: nvinfer0_src
0.054 ~ 0.026   0.057 ~ 0.029   0.044 ~ 0.006   0.043 ~ 0.003                      :: nvmultistreamtiler0_src
0.054 ~ 0.026   0.057 ~ 0.029   0.044 ~ 0.006   0.043 ~ 0.003                      :: nvdsosd0_src
0.054 ~ 0.026   0.057 ~ 0.029   0.044 ~ 0.006   0.043 ~ 0.003                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:07:22.993791410; bps: 15360.000; mean_bps: 14976.000; fps: 29.999; mean_fps: 29.214
perf: fps_cam_m.sink_1; timestamp: 73:07:22.753561660; bps: 15360.000; mean_bps: 14592.000; fps: 29.927; mean_fps: 30.110
perf: fps_cam_m.sink_2; timestamp: 73:07:23.255824609; bps: 15360.000; mean_bps: 15018.667; fps: 30.039; mean_fps: 29.343
perf: fps_fakesink;     timestamp: 73:07:23.745845094; bps: 15360.000; mean_bps: 13158.400; fps: 29.983; mean_fps: 29.995


v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.043 ~ 0.008   0.046 ~ 0.007   0.036 ~ 0.005   0.035 ~ 0.002   0.035 ~ 0.002      :: m_src
0.055 ~ 0.027   0.058 ~ 0.031   0.047 ~ 0.005   0.047 ~ 0.002   0.045 ~ 0.003      :: nvinfer0_src
0.055 ~ 0.027   0.058 ~ 0.031   0.047 ~ 0.005   0.047 ~ 0.002   0.046 ~ 0.003      :: nvmultistreamtiler0_src
0.055 ~ 0.027   0.059 ~ 0.031   0.047 ~ 0.006   0.047 ~ 0.002   0.046 ~ 0.003      :: nvdsosd0_src
0.055 ~ 0.027   0.059 ~ 0.031   0.047 ~ 0.006   0.047 ~ 0.002   0.046 ~ 0.003      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:07:46.897663946; bps: 15360.000; mean_bps: 14848.000; fps: 29.930; mean_fps: 28.898
perf: fps_cam_m.sink_1; timestamp: 73:07:47.357588014; bps: 15360.000; mean_bps: 15168.000; fps: 29.926; mean_fps: 30.205
perf: fps_cam_m.sink_2; timestamp: 73:07:47.127688510; bps: 15360.000; mean_bps: 14976.000; fps: 29.930; mean_fps: 29.395
perf: fps_cam_m.sink_3; timestamp: 73:07:47.587369786; bps: 15360.000; mean_bps: 14720.000; fps: 29.916; mean_fps: 30.167
perf: fps_fakesink;     timestamp: 73:07:47.621333272; bps: 15360.000; mean_bps: 13994.667; fps: 29.974; mean_fps: 32.316
```

