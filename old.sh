#!/bin/bash

# build nav
for file in src/pages/*
do
file_base=`basename $file .md`
post_fm=$(sed -n '/^---$/,/^---$/p' "${file}")
title=$(sed -n 's/^title: //p' <<< "${post_fm}")
author=$(sed -n 's/^author: //p' <<< "${post_fm}")

nav='<a href="'$file_base'.html">'$title'</a>'

echo $nav > nav.html

done

# build pages from markdown
for file in src/pages/*
do

file_base=`basename $file .md`

post_fm=$(sed -n '/^---$/,/^---$/p' "${file}")
title=$(sed -n 's/^title: //p' <<< "${post_fm}")
author=$(sed -n 's/^author: //p' <<< "${post_fm}")

pandoc $file -o tmp.html

cat header.html nav.html tmp.html footer.html > ./dist/$file_base.html

rm tmp.html

done

#build index
cat header.html nav.html footer.html > ./dist/index.html

# copy css
cp ./src/style.css ./dist/style.css