#!/usr/bin/env bash
# Download the pinned upstream Three.js release at build time, not in a visitor's browser.
set -euo pipefail
cd -- "$(dirname -- "${BASH_SOURCE[0]}")"
version=0.158.0
tmp=$(mktemp -d)
trap 'rm -rf -- "$tmp"' EXIT
npm pack "three@$version" --registry=https://registry.npmjs.org --ignore-scripts --silent --pack-destination "$tmp"
tar -xzf "$tmp/three-$version.tgz" -C "$tmp"
pkg="$tmp/package"
node -e 'if (require(process.argv[1]).version !== process.argv[2]) process.exit(1)' "$pkg/package.json" "$version"
# Preserve addon paths exactly as the original import map expects.
dest="$tmp/local-three"
mkdir -p "$dest/build" "$dest/examples/jsm/loaders" "$dest/examples/jsm/libs"
cp "$pkg/LICENSE" "$dest/LICENSE"
cp "$pkg/build/three.module.js" "$dest/build/"
cp "$pkg/examples/jsm/loaders/GLTFLoader.js" "$pkg/examples/jsm/loaders/DRACOLoader.js" "$dest/examples/jsm/loaders/"
cp -R "$pkg/examples/jsm/utils" "$dest/examples/jsm/"
cp -R "$pkg/examples/jsm/libs/draco" "$dest/examples/jsm/libs/"
for rel in build/three.module.js examples/jsm/loaders/GLTFLoader.js examples/jsm/loaders/DRACOLoader.js examples/jsm/utils/BufferGeometryUtils.js examples/jsm/libs/draco/draco_decoder.js examples/jsm/libs/draco/draco_decoder.wasm examples/jsm/libs/draco/draco_wasm_wrapper.js LICENSE; do
  test -s "$dest/$rel" || { echo "Missing dependency: $rel" >&2; exit 1; }
done
mkdir -p vendor
rm -rf -- vendor/three
mv "$dest" vendor/three
echo "Three.js $version and Draco are ready under vendor/three."
