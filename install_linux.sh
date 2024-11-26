#!/bin/bash

# Check if an KiCad version is provided.
if [ -z "$1" ]; then
  echo "::error::Please supply KiCad version that needs to be installed."
  exit 1
fi

# Check if the provided KiCad version is in the x.x format.
if ! [[ "$1" =~ [0-9]+[.][0-9]+$ ]]; then
  echo "::error::Please supply an KiCad version that follows the x.x format."
  exit 1
fi

# Install KiCad
sudo add-apt-repository ppa:kicad/kicad-$1-releases
sudo apt-get update
sudo apt-get install --yes kicad

KICADCONFDIR="~/.config/kicad/8.0"
mkdir -p "$KICADCONFDIR"
cp /usr/share/kicad/template/sym-lib-table "$KICADCONFDIR"
cp /usr/share/kicad/template/fp-lib-table "$KICADCONFDIR"
