#!/bin/bash

USB_DEVICE = $1
usbip attach -r host.docker.internal -b ${USB_DEVICE}