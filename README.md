# streaming-host-sample

This project contains sample of video streaming host that building docker-compose.
RTMP server is built up by [nginx-rtmp-module](https://github.com/arut/nginx-rtmp-module).
Broadcast server sends video stream to RTMP server by using FFmpeg.
Streaming sever sends video by HLS(HTTP Live Streaming).

## Overview of containers

![Overview of containers](https://raw.githubusercontent.com/nsoushi/streaming-host-sample/master/docs/streaming_host_diagram.png)

## How to start

requirements
* [dind](https://hub.docker.com/_/docker/)
* [direnv](https://github.com/direnv/direnv)

**1:build up host(using dind)**
```
cd (path-to-'streaming-host-sample')
docker-compose up -d
```

**2:build up containers**
```
cd (path-to-'streaming-host-sample')
cd ./streaming_host
docker-compose up -d
```
then you will be able to access `http://localhost/hls/broadcast.m3u8` and watch sample movie.
If you want to stream live that set up RTMP URL `rtmp://localhost:1935/encoder`. 
