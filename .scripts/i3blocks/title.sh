#!/bin/bash

while read xtit
do
    echo $xtit
done < <(./xtitle -s)
