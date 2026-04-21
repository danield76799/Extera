#!/bin/sh -ve
# Web preparation for Plusly

# Create directories for olm (Matrix encryption library)
# Note: index.html references assets/assets/js/package/olm.js
mkdir -p web/assets/assets/js/package

# Download olm.js and olm.wasm from unpkg
if [ ! -f web/assets/assets/js/package/olm.js ] || [ $(stat -c%s web/assets/assets/js/package/olm.js 2>/dev/null || echo 0) -lt 1000 ]; then
    curl -sL "https://unpkg.com/@matrix-org/olm/olm.js" -o web/assets/assets/js/package/olm.js
fi

if [ ! -f web/assets/assets/js/package/olm.wasm ] || [ $(stat -c%s web/assets/assets/js/package/olm.wasm 2>/dev/null || echo 0) -lt 1000 ]; then
    curl -sL "https://unpkg.com/@matrix-org/olm/olm.wasm" -o web/assets/assets/js/package/olm.wasm
fi

# Verify files were downloaded
echo "olm.js size: $(stat -c%s web/assets/assets/js/package/olm.js 2>/dev/null || echo 'N/A')"
echo "olm.wasm size: $(stat -c%s web/assets/assets/js/package/olm.wasm 2>/dev/null || echo 'N/A')"
