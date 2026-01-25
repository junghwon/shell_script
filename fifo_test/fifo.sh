#! /bin/bash

FIFO_SMPL=./fifo_smple

rm -f "$FIFO_SMPL"
mkfifo "$FIFO_SMPL"

echo "test" > "$FIFO_SMPL" &

echo | cat "$FIFO_SMPL"