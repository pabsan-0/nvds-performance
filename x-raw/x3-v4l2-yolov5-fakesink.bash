source ../devices.cfg

gst-launch-1.0                                                                                          \
    v4l2src device="$CAM_0"                                                                             \
        ! videoconvert ! 'video/x-raw,format=I420,width=320,height=240'                                 \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)I420,width=320,height=240'          \
        ! m.sink_0                                                                                      \
    v4l2src device="$CAM_1"                                                                             \
        ! videoconvert ! 'video/x-raw,format=I420,width=320,height=240'                                 \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)I420,width=320,height=240'          \
        ! m.sink_1                                                                                      \
    v4l2src device="$CAM_2"                                                                             \
        ! videoconvert ! 'video/x-raw,format=I420,width=320,height=240'                                 \
        ! queue leaky=2 max-size-buffers=100 max-size-time=0 max-size-bytes=0                           \
        ! nvvideoconvert ! 'video/x-raw(memory:NVMM),format=(string)I420,width=320,height=240'          \
        ! m.sink_2                                                                                      \
    nvstreammux name=m batch-size=1 width=640 height=640 nvbuf-memory-type=0                            \
    ! nvvideoconvert ! nvinfer interval=0 config-file-path="/nvds/assets/coco_config_infer_primary.txt" \
    ! nvmultistreamtiler width=640 height=480                                                           \
    ! nvvideoconvert ! nvdsosd                                                                          \
    ! nveglglessink async=0 sync=0                                                                      ;
    # ! videoconvert ! fakesink 2> "$LOGFILE"                                                             ;
    # ! nvvideoconvert ! 'video/x-raw,format=I420' ! autovideosink sync=0 async=0                         ;
