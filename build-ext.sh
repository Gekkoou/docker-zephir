#!/bin/bash

set -ex

VERSION=$(php -r 'list($a, $b, $c) = explode(".",phpversion()); echo $a.".".$b;')
BASEDIR=/zephir

cd ${BASEDIR}/test

zephir build


if [ ! -e ${BASEDIR}/lib/${VERSION} ]; then
    mkdir -p ${BASEDIR}/lib/${VERSION}
fi

cp ext/modules/*.so ${BASEDIR}/lib/${VERSION}/

zephir fullclean
