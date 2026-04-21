#!/bin/sh -ve
# Web preparation for Plusly

# Create directories
mkdir -p assets/js/package

# Download olm.js and olm.wasm from unpkg (Matrix encryption library)
if [ ! -f assets/js/package/olm.js ] || [ $(stat -c%s assets/js/package/olm.js 2>/dev/null || echo 0) -lt 1000 ]; then
    curl -sL "https://unpkg.com/@matrix-org/olm/olm.js" -o assets/js/package/olm.js
fi

if [ ! -f assets/js/package/olm.wasm ] || [ $(stat -c%s assets/js/package/olm.wasm 2>/dev/null || echo 0) -lt 1000 ]; then
    curl -sL "https://unpkg.com/@matrix-org/olm/olm.wasm" -o assets/js/package/olm.wasm
fi

# Verify files were downloaded
echo "olm.js size: $(stat -c%s assets/js/package/olm.js 2>/dev/null || echo 'N/A')"
echo "olm.wasm size: $(stat -c%s assets/js/package/olm.wasm 2>/dev/null || echo 'N/A')"
