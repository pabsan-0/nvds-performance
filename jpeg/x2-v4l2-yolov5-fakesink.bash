source ../devices.cfg

gst-launch-1.0                                                                                          \
    v4l2src device="$CAM_0" ! 'image/jpeg, width=1920,height=1080'                                      \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)NV12'                               \
        ! queue leaky=2 max-size-buffers=2 max-size-time=0 max-size-bytes=1                             \
        ! m.sink_0                                                                                      \
    v4l2src device="$CAM_1" ! 'image/jpeg, width=1920,height=1080'                                      \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)NV12'                               \
        ! queue leaky=2 max-size-buffers=2 max-size-time=0 max-size-bytes=1                             \
        ! m.sink_1                                                                                      \
    nvstreammux name=m batch-size=2 width=1280 height=1280 nvbuf-memory-type=0                          \
    ! nvvideoconvert ! nvinfer interval=0 config-file-path="/nvds/assets/coco_config_infer_primary.txt" \
    ! nvmultistreamtiler width=1280 height=420                                                          \
    ! nvvideoconvert ! nvdsosd                                                                          \
    ! nveglglessink async=0 sync=0                                                                      ;
