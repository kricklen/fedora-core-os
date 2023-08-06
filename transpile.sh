#!/usr/bin/env bash
docker pull quay.io/coreos/butane:release
docker run -i --rm quay.io/coreos/butane:release --pretty --strict < example.bu > example.ign
