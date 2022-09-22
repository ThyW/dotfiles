#!/bin/bash

old_ext=t.i3config
new_ext=i3config

for file in *.$old_ext
do
    mv -v "$file" "${file%.$old_ext}.$new_ext"
done;
