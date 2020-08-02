#!/bin/sh

dir_name=$1
readme="${dir_name}/README.md"

mkdir ${dir_name}
cat << EOS > ${readme}
# ${dir_name}

## Class Image

## Use Cases

## Points

## Reference


EOS