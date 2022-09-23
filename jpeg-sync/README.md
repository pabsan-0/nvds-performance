# jpeg-sync low res
```
v4l2src width=320,height=240
queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0
nvstreammux batch-size=1 width=640 height=640 nvbuf-memory-type=0
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



# jpeg-sync high res
```
v4l2src width=*,height=*
queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0
nvstreammux name=m batch-size=1 width=640 height=640 nvbuf-memory-type=0
```
## BATCHSIZE = N_CAMERAS
```
v4l2src width=1920,height=1080
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.046 ~ 0.009   0.036 ~ 0.004   0.047 ~ 0.008                                      :: m_src
0.052 ~ 0.026   0.049 ~ 0.076   0.052 ~ 0.008                                      :: nvinfer0_src
0.052 ~ 0.026   0.049 ~ 0.076   0.052 ~ 0.008                                      :: nvmultistreamtiler0_src
0.052 ~ 0.026   0.049 ~ 0.076   0.053 ~ 0.008                                      :: nvdsosd0_src
0.052 ~ 0.026   0.049 ~ 0.076   0.053 ~ 0.008                                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:48:00.408661398; bps: 15360.000; mean_bps: 14745.600; fps: 29.997; mean_fps: 28.691
perf: fps_cam_m.sink_1; timestamp: 73:48:00.681189536; bps: 15360.000; mean_bps: 14745.600; fps: 29.877; mean_fps: 29.064
perf: fps_fakesink;     timestamp: 73:48:01.222912306; bps: 15360.000; mean_bps: 12580.571; fps: 29.998; mean_fps: 30.731


v4l2src width=1280,height=720
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.041 ~ 0.006   0.037 ~ 0.004   0.037 ~ 0.003   0.044 ~ 0.006                      :: m_src
0.050 ~ 0.026   0.050 ~ 0.057   0.046 ~ 0.003   0.052 ~ 0.006                      :: nvinfer0_src
0.050 ~ 0.026   0.050 ~ 0.057   0.046 ~ 0.003   0.052 ~ 0.006                      :: nvmultistreamtiler0_src
0.051 ~ 0.026   0.050 ~ 0.057   0.046 ~ 0.003   0.053 ~ 0.006                      :: nvdsosd0_src
0.051 ~ 0.026   0.050 ~ 0.057   0.046 ~ 0.003   0.053 ~ 0.006                      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:48:25.432759830; bps: 15360.000; mean_bps: 13824.000; fps: 29.927; mean_fps: 27.348
perf: fps_cam_m.sink_1; timestamp: 73:48:25.639989302; bps: 15360.000; mean_bps: 13824.000; fps: 29.918; mean_fps: 27.809
perf: fps_cam_m.sink_2; timestamp: 73:48:25.848072284; bps: 15360.000; mean_bps: 14720.000; fps: 29.847; mean_fps: 29.376
perf: fps_fakesink;     timestamp: 73:48:26.349010648; bps: 15360.000; mean_bps: 12288.000; fps: 29.997; mean_fps: 33.876


v4l2src width=800,height=600
v4l2src         v4l2src0_src    v4l2src1_src    v4l2src2_src    v4l2src3_src
0.039 ~ 0.004   0.038 ~ 0.003   0.036 ~ 0.002   0.041 ~ 0.005   0.037 ~ 0.002      :: m_src
0.051 ~ 0.027   0.052 ~ 0.045   0.047 ~ 0.003   0.052 ~ 0.005   0.048 ~ 0.003      :: nvinfer0_src
0.051 ~ 0.027   0.052 ~ 0.045   0.047 ~ 0.003   0.053 ~ 0.005   0.048 ~ 0.003      :: nvmultistreamtiler0_src
0.052 ~ 0.027   0.053 ~ 0.045   0.048 ~ 0.003   0.053 ~ 0.005   0.048 ~ 0.003      :: nvdsosd0_src
0.052 ~ 0.027   0.053 ~ 0.045   0.048 ~ 0.003   0.053 ~ 0.005   0.048 ~ 0.003      :: fakesink0_sink
perf: fps_cam_m.sink_0; timestamp: 73:48:52.157591009; bps: 15360.000; mean_bps: 13653.333; fps: 29.890; mean_fps: 27.071
perf: fps_cam_m.sink_1; timestamp: 73:48:52.081792443; bps: 15360.000; mean_bps: 12800.000; fps: 30.044; mean_fps: 30.636
perf: fps_cam_m.sink_2; timestamp: 73:48:52.371272158; bps: 15360.000; mean_bps: 13653.333; fps: 29.878; mean_fps: 27.347
perf: fps_cam_m.sink_3; timestamp: 73:48:53.065970399; bps: 15360.000; mean_bps: 13312.000; fps: 29.984; mean_fps: 30.352
perf: fps_fakesink; timestamp: 73:48:53.066691545; bps: 15360.000; mean_bps: 10547.200; fps: 29.983; mean_fps: 30.075

```