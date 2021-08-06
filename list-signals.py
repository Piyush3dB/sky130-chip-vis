#!/usr/bin/env python3
from vcdvcd import VCDVCD
import os
import sys
import pdb as pdb
import json

if len(sys.argv) < 2:
    print(f"Usage: {sys.argv[1]} <path to vcd file>")
    sys.exit(1)

signals = []
vcd = VCDVCD(sys.argv[1])
#for x in vcd.signals:
    #print(x)

with open('build/vcd_signals.json', 'w') as f:
    json.dump(vcd.signals, f, indent=4)

