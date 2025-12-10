#!/bin/bash
# Based on:
# https://www.tommygeorge.com/blog/ffmpeg-crush-use-ffmpeg-to-reduce-video-file-size/
#
# Use ffmpeg to compress a given video to a 24fps mp4.
# It uses slow compression to get the smallest FILE SIZE.
# This has been incredibly helpful when I've exported screen
# casts from QuickTime or iMovie. There's usually no need
# for 1080p60fps for a bug report. 😅
# The maximum output size will be 1280w||720h, preserving aspect ratio.
# Optionally adding single-pixel black padding if the video size is
# an odd number of pixels (which makes h264 sad).
ffmpeg_crush() {
    # Check if input file exists
    if [[ ! -f "${1}" ]]; then
        echo "Could not find the provided input file: ${1}"
        return 1
    fi

    # Extract input file name without extension
    input_file_name_without_ext=${1%.*}

    # Run ffmpeg command!
    # Explained:
    #   -i == input file
    #   -r == set 24fps. Might be redundant with the next, but 🤷‍♂️
    #   -vf fps 24 == video filter for 24fps. Might be redundant with previous.  🤷‍♂️ https://trac.ffmpeg.org/wiki/ChangingFrameRate
    #   ... scale == Some math+functions to scale the input video frames to fit within a 1280x720 size while preserving the aspect ratio. If the original video has a width greater than its height, it resizes the video to 1080 pixels wide while maintaining the aspect ratio. If the original video has a height greater than or equal to its width, it resizes the video to 720 pixels tall while maintaining the aspect ratio.
    #   -c:v == This specifies the video codec to be used for encoding the output. In this case, libx264 is chosen, which is a widely used H.264 video codec.
    #   -crf == This sets the Constant Rate Factor (CRF) for video quality. ChatGPT chose this. 😬
    #   -preset veryslow == This sets the encoding preset, which determines the trade-off between encoding speed and compression efficiency. The veryslow preset provides the highest compression efficiency but is the slowest in terms of encoding speed.
    #   {output_file_name} == setting the output filename to always be mp4.
    ffmpeg -i "$1" \
           -r 24 \
           -vf "fps=24,scale='if(gt(iw,ih),1280,-1)':'if(gt(iw,ih),-1,720)',pad=ceil(iw/2)*2:ceil(ih/2)*2" \
           -c:v libx264 \
           -crf 23 \
           -preset veryslow \
           -af "aresample=async=1:min_comp=0.001:min_hard_comp=0.100000" \
           -ar 44100 \
           "${input_file_name_without_ext}-crushed.mp4"
}

if [[ $# -eq 0 ]]; then
    echo "Usage: ffmpeg_crush input_video_file1 [input_video_file2 ...]"
    return 1
fi

for f in "$@"
do 
  ffmpeg_crush "${f}"
done 
