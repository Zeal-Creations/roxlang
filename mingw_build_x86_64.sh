#!/usr/bin/env sh

if [ ! -d "./build/" ];then
    echo "-- path: \"./build/\" will be created."
    mkdir ./build
else
    echo "-- path: \"./build/\" exists, will skip create."
fi

if [ ! -d "./release/" ];then
    echo "-- path: \"./release/\" will be created."
    mkdir ./release
else
    echo "-- path: \"./release/\" exists, will skip create."
fi

cd build

echo "-- remove built files --"
rm -rf *

echo "-- start cmake"
cmake .. -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -DCMAKE_SH="CMAKE_SH-NOTFOUND"
echo "-- end cmake"

echo "-- start make"
mingw32-make -j8
echo "-- end make"
