#!/bin/bash

# Fetch process
# TODO: return flag for different fetch status
fetchStep(){
echo "--------------------Starting fetch for $1--------------------"
git fetch
}

# Merge process
mergeStep(){
if [ $? -eq 0 ];then
    read -n2 -p "Merge the change [Y/N]?" answer
    case $answer in
    Y | y)
        echo "--------------------Starting Merge for $1--------------------"
        git merge
        ;;
    N | n)
        echo "--------------------Merge step passed--------------------"
        ;;
    *)
        echo "[WARNING] error choice, Please merge manually!"
        ;;
    esac
else
    echo "[Error] Exiting with unknown exception"
fi
}

#All dir traversal
doAllPkg(){
for file in ./*
do
if [ -d $file ];then
    cd $file
    fetchStep $file
    mergeStep $file
    cd ..
fi
done
}

# main
read -p "Please input target package name:" PKG
if [ -z $PKG ];then
    doAllPkg
else
    while [ ! -e $PKG ];do
        echo "[WARNING] $PKG is not existed"
        read -p "Please input a valid package name:" PKG
    done
    cd $PKG
    fetchStep $PKG
    mergeStep $PKG
fi

echo "--------------------Finished--------------------"


