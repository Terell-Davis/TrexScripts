#!/bin/bash

apt-get update && apt-get install -y git python3-dev python3-pip gcc wget unzip tar gcc

# Archipelago install
if [ "$(ls -A ./archipelago)" ]; then
    cd ./archipelago && git pull && cd ..
else
    git clone "https://github.com/ArchipelagoMW/Archipelago.git" ./archipelago/

    if [ ! -d "./archipelago/EnemizerCLI" ]; then
        wget "https://github.com/Ijwu/Enemizer/releases/latest/download/ubuntu.16.04-x64.zip"
        mkdir -p ./archipelago/EnemizerCLI
        unzip -u ubuntu.16.04-x64.zip -d ./archipelago/EnemizerCLI
        chmod -R 777 ./archipelago/EnemizerCLI
        rm ubuntu.16.04-x64.zip
    fi

    if [ ! -d "./archipelago/SNI" ]; then
        wget "https://github.com/alttpo/sni/releases/download/v0.0.97/sni-v0.0.97-linux-amd64.tar.xz"
        mkdir -p ./archipelago/SNI
        tar -xJf sni-v0.0.97-linux-amd64.tar.xz -C ./archipelago/SNI
        chmod -R 777 ./archipelago/SNI
        rm sni-v0.0.97-linux-amd64.tar.xz
    fi
fi

pip3 install setuptools
pip3 install Cython
pip3 install -r ./archipelago/requirements.txt
pip3 install  -r ./archipelago/WebHostLib/requirements.txt
python3 ./archipelago/ModuleUpdate.py -y
cythonize -b -i ./archipelago/_speedups.pyx

mkdir -p ./archipelago/Players
