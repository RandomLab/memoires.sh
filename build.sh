#!/bin/bash

rm -rf dist/**

for md in **/index.md; do
    dir=$(dirname $md)
    mkdir dist/${dir}
    mkdir dist/${dir}/assets
    cp -r assets/style.css dist/${dir}/assets/style.css
    pandoc -s "${md}" -o dist/"${dir}"/index.html --template template.html --css assets/style.css 2>/dev/null
done

mkdir dist/assets
cp -r assets/style.css dist/assets/style.css

pandoc -s index.md -o dist/index.html --template template.html --css assets/style.css