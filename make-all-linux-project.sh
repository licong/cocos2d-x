#!/bin/bash

TXTCOLOR_DEFAULT="\033[0;m"
TXTCOLOR_RED="\033[0;31m"
TXTCOLOR_GREEN="\033[0;32m"

COCOS2DX20_TRUNK=`pwd`
OUTPUT_DEBUG=$COCOS2DX20_TRUNK/lib/linux/Debug/
OUTPUT_RELEASE=$COCOS2DX20_TRUNK/lib/linux/Release/

check_make_result()
{
	if [ 0 != $? ]; then
	    exit 1
   	fi
}

DEPENDS='libx11-dev'
DEPENDS+=' libxmu-dev'
DEPENDS+=' libglu1-mesa-dev'
DEPENDS+=' libgl2ps-dev'
DEPENDS+=' libxi-dev'
DEPENDS+=' libglfw-dev'
DEPENDS+=' g++'
DEPENDS+=' libzip-dev'
DEPENDS+=' libcurl4-gnutls-dev'
DEPENDS+=' libfontconfig1-dev'
DEPENDS+=' libsqlite3-dev'
DEPENDS+=' libglew-dev'

for i in $DEPENDS; do
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $i | grep "install ok installed")
	echo Checking for $i: $PKG_OK
	if [ "" == "$PKG_OK" ]; then
	  echo -e $TXTCOLOR_GREEN"No $i. Setting up $i, please enter your password:"$TXTCOLOR_DEFAULT
	  sudo apt-get --force-yes --yes install $i
	fi
done

mkdir -p $OUTPUT_DEBUG
mkdir -p $OUTPUT_RELEASE

make -C $COCOS2DX20_TRUNK/external/Box2D/proj.linux clean
make -C $COCOS2DX20_TRUNK/external/Box2D/proj.linux debug
check_make_result
cp $COCOS2DX20_TRUNK/external/Box2D/proj.linux/libbox2d.a $OUTPUT_DEBUG
rm $COCOS2DX20_TRUNK/external/Box2D/proj.linux/libbox2d.a

make -C $COCOS2DX20_TRUNK/external/Box2D/proj.linux clean
make -C $COCOS2DX20_TRUNK/external/Box2D/proj.linux release
check_make_result
cp $COCOS2DX20_TRUNK/external/Box2D/proj.linux/libbox2d.a $OUTPUT_RELEASE
rm $COCOS2DX20_TRUNK/external/Box2D/proj.linux/libbox2d.a

make -C $COCOS2DX20_TRUNK/external/chipmunk/proj.linux clean
make -C $COCOS2DX20_TRUNK/external/chipmunk/proj.linux debug
check_make_result
cp $COCOS2DX20_TRUNK/external/chipmunk/proj.linux/libchipmunk.a $OUTPUT_DEBUG
rm $COCOS2DX20_TRUNK/external/chipmunk/proj.linux/libchipmunk.a

make -C $COCOS2DX20_TRUNK/external/chipmunk/proj.linux clean
make -C $COCOS2DX20_TRUNK/external/chipmunk/proj.linux release
check_make_result
cp $COCOS2DX20_TRUNK/external/chipmunk/proj.linux/libchipmunk.a $OUTPUT_RELEASE
rm $COCOS2DX20_TRUNK/external/chipmunk/proj.linux/libchipmunk.a

make -C $COCOS2DX20_TRUNK/cocos2dx/proj.linux clean
make -C $COCOS2DX20_TRUNK/cocos2dx/proj.linux debug
check_make_result
cp $COCOS2DX20_TRUNK/cocos2dx/proj.linux/libcocos2d.so $OUTPUT_DEBUG
rm $COCOS2DX20_TRUNK/cocos2dx/proj.linux/libcocos2d.so

make -C $COCOS2DX20_TRUNK/cocos2dx/proj.linux clean
make -C $COCOS2DX20_TRUNK/cocos2dx/proj.linux release
check_make_result
cp $COCOS2DX20_TRUNK/cocos2dx/proj.linux/libcocos2d.so $OUTPUT_RELEASE
rm $COCOS2DX20_TRUNK/cocos2dx/proj.linux/libcocos2d.so

make -C $COCOS2DX20_TRUNK/CocosDenshion/proj.linux clean
make -C $COCOS2DX20_TRUNK/CocosDenshion/proj.linux debug
check_make_result
cp $COCOS2DX20_TRUNK/CocosDenshion/proj.linux/libcocosdenshion.so $OUTPUT_DEBUG
rm $COCOS2DX20_TRUNK/CocosDenshion/proj.linux/libcocosdenshion.so

make -C $COCOS2DX20_TRUNK/CocosDenshion/proj.linux clean
make -C $COCOS2DX20_TRUNK/CocosDenshion/proj.linux release
check_make_result
cp $COCOS2DX20_TRUNK/CocosDenshion/proj.linux/libcocosdenshion.so $OUTPUT_RELEASE
rm $COCOS2DX20_TRUNK/CocosDenshion/proj.linux/libcocosdenshion.so

make -C $COCOS2DX20_TRUNK/scripting/lua/proj.linux clean
make -C $COCOS2DX20_TRUNK/scripting/lua/proj.linux debug
check_make_result
cp $COCOS2DX20_TRUNK/scripting/lua/proj.linux/liblua.so $OUTPUT_DEBUG
rm $COCOS2DX20_TRUNK/scripting/lua/proj.linux/liblua.so

make -C $COCOS2DX20_TRUNK/scripting/lua/proj.linux clean
make -C $COCOS2DX20_TRUNK/scripting/lua/proj.linux release
check_make_result
cp $COCOS2DX20_TRUNK/scripting/lua/proj.linux/liblua.so $OUTPUT_RELEASE
rm $COCOS2DX20_TRUNK/scripting/lua/proj.linux/liblua.so

make -C $COCOS2DX20_TRUNK/samples/Cpp/TestCpp/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Cpp/TestCpp/proj.linux debug
check_make_result
make -C $COCOS2DX20_TRUNK/samples/Cpp/TestCpp/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Cpp/TestCpp/proj.linux release
check_make_result

make -C $COCOS2DX20_TRUNK/samples/Cpp/HelloCpp/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Cpp/HelloCpp/proj.linux debug
check_make_result
make -C $COCOS2DX20_TRUNK/samples/Cpp/HelloCpp/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Cpp/HelloCpp/proj.linux release
check_make_result

make -C $COCOS2DX20_TRUNK/samples/Lua/TestLua/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Lua/TestLua/proj.linux debug
check_make_result
make -C $COCOS2DX20_TRUNK/samples/Lua/TestLua/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Lua/TestLua/proj.linux release
check_make_result

make -C $COCOS2DX20_TRUNK/samples/Lua/HelloLua/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Lua/HelloLua/proj.linux debug
check_make_result
make -C $COCOS2DX20_TRUNK/samples/Lua/HelloLua/proj.linux clean
make -C $COCOS2DX20_TRUNK/samples/Lua/HelloLua/proj.linux release
check_make_result

