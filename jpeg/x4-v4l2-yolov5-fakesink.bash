source ../devices.cfg

gst-launch-1.0                                                                                          \
    v4l2src device="$CAM_0" ! 'image/jpeg, width=800,height=600'                                        \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)NV12'                               \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! m.sink_0                                                                                      \
    v4l2src device="$CAM_1" ! 'image/jpeg, width=800,height=600'                                        \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)NV12'                               \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! m.sink_1                                                                                      \
    v4l2src device="$CAM_2" ! 'image/jpeg, width=800,height=600'                                        \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)NV12'                               \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! m.sink_2                                                                                      \
    v4l2src device="$CAM_3" ! 'image/jpeg, width=800,height=600'                                        \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)NV12'                               \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! m.sink_3                                                                                      \
    nvstreammux name=m batch-size=8 width=1280 height=1280 nvbuf-memory-type=0                          \
    ! nvvideoconvert ! nvinfer interval=0 config-file-path="/nvds/assets/coco_config_infer_primary.txt" \
    ! nvmultistreamtiler width=1280 height=1280                                                         \
    ! nvvideoconvert ! nvdsosd                                                                          \
    ! nveglglessink async=0 sync=0                                                                      ;
