#!/bin/bash


mkdir -p icon-tmp.iconset;
rm icon-tmp.iconset/*.png
cp icon.png icon-tmp.iconset/
cd icon-tmp.iconset
for SIZE in 512 256 128 64 32 16 
do
  convert icon.png  -resize "${SIZE}x$SIZE" "icon_${SIZE}x$SIZE.png";
done

for SIZE in 1024 512 256 128 64 32 16 
do
  SIZE2=$(($SIZE / 2 ));
  convert icon.png  -resize "${SIZE2}x${SIZE2}" "icon_${SIZE}x${SIZE}@2x.png";
done
cd ..
iconutil -c icns icon-tmp.iconset
rm -r icon-tmp.iconset
