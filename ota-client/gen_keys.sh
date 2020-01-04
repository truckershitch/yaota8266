#!/bin/bash

if [[ -f "priv.key" ]]; then
    echo -e "\nKeys already created, ok.\n"
else
    (
        set -ex
        BITS=512
        # OTA server expects a key with exponent 3
        openssl genrsa -out priv.key -3 $BITS
        openssl rsa -in priv.key -pubout -out pub.key
        openssl pkey -in priv.key -text
    )
fi
