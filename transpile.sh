#!/usr/bin/env bash
docker pull quay.io/coreos/fcct:release
docker run -i --rm quay.io/coreos/fcct:release --pretty --strict < example.fcc > example.ign
