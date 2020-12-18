# Fedora CoreOS Home Setup

## Goal
This repository contains the fcos configs to setup a basic server with git, ansible, fail2ban and google-authenticator installed.
Also the disk setup should be done already.

## Status
Heavy beta :)

## Dependencies
Download the following for a local VirtualBox setup:
* VirtualBox, latest stable (https://www.virtualbox.org/wiki/Downloads)
* Fedora CoreOS, latest stable (https://getfedora.org/en/coreos/download?tab=metal_virtualized&stream=stable)
* Docker Desktop, latest stable (https://www.docker.com/get-started)

## Installation
* Install VirtualBox
* Create a new VM with 2GB mem and 8GB disk
* Attach the fcos iso as cdrom
* Boot the machine, fcos should reach a shell prompt

### Official documentation
https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/#_installing_from_live_iso

### HowTo for this installation
The docker image for fcc transpiler and the validator is required. Pull it on the developer machine by hand, it will be pulled by the scripts also:
`docker pull quay.io/coreos/fcct:release`
`docker pull quay.io/coreos/ignition-validate:release`

Now begin with editing the fcos config (.fcc). The documentation for fcc is available here:
https://docs.fedoraproject.org/en-US/fedora-coreos/fcct-config/

### Transpile a fcos config
The official documentation:
https://docs.fedoraproject.org/en-US/fedora-coreos/producing-ign/

Use the following command to transpile the fcc:
`./transpile.sh`

Validate the .ign file:
`./validate.sh`

### Upload the .ign file
Upload the .ign file somewhere so that the vm can access it via https, like github.

### Install the .ign file on the vm
Start the coreos installer on the vm with the .ign config:
`sudo coreos-installer install /dev/sda --ignition-url https://example.com/example.ign`
