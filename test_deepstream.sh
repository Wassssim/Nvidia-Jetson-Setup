#!/bin/bash
if [ ! -d "/opt/nvidia/deepstream/deepstream/sources/apps/sample_apps/deepstream-test1-rtsp_out/" ] 
then
	cp -rv ./deepstream-test1-rtsp_out /opt/nvidia/deepstream/deepstream/sources/apps/sample_apps/ 
fi

cd /opt/nvidia/deepstream/deepstream/sources/apps/sample_apps/deepstream-test1-rtsp_out/ && make clean && make && chmod +x deepstream-test1-app\
	&& ./deepstream-test1-app /opt/nvidia/deepstream/deepstream/samples/streams/sample_720p.h264
