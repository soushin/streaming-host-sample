#!/bin/bash

ffmpeg -re -stream_loop -1 -i '/data/broadcast_source.mp4' -f flv "${RTMP_SERVER_URL}/${STREAM_NAME}"
