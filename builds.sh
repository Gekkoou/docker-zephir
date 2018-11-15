#!/bin/bash

set -ex

for tag in '7.2' '7.1' '7.0' '5.6' '5.5' '5.4'
do
    docker run -it --rm --name zephir -v $(pwd):/zephir tuwen/zephir:${tag} bash /zephir/build-ext.sh
done
