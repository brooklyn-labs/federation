#!/bin/sh
# Build forked packages: @brooklyn-labs/federation and @brooklyn-labs/subgraph

set -e

# npm_config_engine_strict=false npm install --package-lock-only --ignore-scripts

npm_config_engine_strict=false npm ci --ignore-scripts
npm run compile:stage-01

echo "Build outputs:"
echo "  - subgraph-js/dist"
echo "  - federation-js/dist"

ls -la subgraph-js/dist
ls -la federation-js/dist

# Generate publishable .tgz files
SUBGRAPH_TARBALL="$(cd subgraph-js && npm pack)"
FEDERATION_TARBALL="$(cd federation-js && npm pack)"

echo "Tarballs:"
echo "  - $(cd subgraph-js && pwd)/$SUBGRAPH_TARBALL"
echo "  - $(cd federation-js && pwd)/$FEDERATION_TARBALL"
