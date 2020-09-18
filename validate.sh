#!/usr/bin/env bash
docker run -it --rm -v ${PWD}:/pwd -w /pwd quay.io/coreos/ignition-validate:release example.ign && echo "Success!"
