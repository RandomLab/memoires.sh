#!/bin/bash

rm -rf dist/**

for md in **/index.md; do
    dir=$(dirname $md)
    mkdir dist/${dir}
    pandoc -s "${md}" -o dist/"${dir}"/index.html --template template.html
done

cp -r assets/style.css dist/style.css

pandoc -s index.md -o dist/index.html --template template.html