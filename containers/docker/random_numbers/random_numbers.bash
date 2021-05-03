#!/usr/bin/bash
seq 1 1000 | shuf | head -$1
