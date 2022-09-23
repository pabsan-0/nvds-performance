source ../devices.cfg

gst-launch-1.0                                                                                          \
    v4l2src device="$CAM_0"                                                                             \
        ! nvv4l2decoder                                                                                 \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)I420,width=1280,height=1280'        \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=1                           \
        ! m.sink_0                                                                                      \
    nvstreammux name=m batch-size=1 width=1280 height=1280 nvbuf-memory-type=0                          \
    ! nvvideoconvert ! nvinfer interval=0 config-file-path="/nvds/assets/coco_config_infer_primary.txt" \
    ! nvmultistreamtiler width=640 height=480                                                           \
    ! nvvideoconvert ! nvdsosd                                                                          \
    ! nveglglessink async=0 sync=0                                                                      ;
