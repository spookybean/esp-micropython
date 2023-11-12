#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "Usage: ./install.sh <PORT> <BAUD_RATE> <BIN_PATH>"
    exit 1
fi

PORT="$1"
BAUD_RATE="$2"
BIN_PATH="$3"

if [ -z "$PORT" ]; then
    echo "Error: PORT is not specified."
    exit 1
fi

if [ -z "$BAUD_RATE" ]; then
    echo "Error: BAUD_RATE is not specified."
    exit 1
fi

if [ ! -e "$BIN_PATH" ]; then
    echo "Error: BIN_PATH is not a valid file."
    exit 1
fi

esptool.py \
    --port "$PORT" \
    --baud "$BAUD_RATE" \
    --after no_reset write_flash \
    --flash_size detect \
    --flash_mode dio 0x00000 "$BIN_PATH" \
    --erase-all
