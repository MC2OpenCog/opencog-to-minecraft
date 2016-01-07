#!/bin/bash

if [ -d catkin_ws/src ] ; then
    echo "catkin_ws/src found"
else
    mkdir -p catkin_ws/src
fi

if [ -a catkin_ws/devel/setup.bash ] ; then
    echo "catkin workspace already configured"
else
    echo "configuring catkin workspace"
    cd catkin_ws/src
    catkin_init_workspace
    cd -
fi

if [ -d catkin_ws/src/minecraft_bot ] ; then
    echo "minecraft_bot package already setup in catkin workspace"
else
    cd catkin_ws/src
    # Add the package
    ln -s ../../minecraft_bot/ minecraft_bot
    # make the folder that would have been if `catkin_create_pkg` was used.
    mkdir -p minecraft_bot/include/minecraft_bot/
    cd -
fi

cd catkin_ws
catkin_make
cd -
