#!/bin/bash

for i in $(cat ../article_list); do
    touch ../source/_posts/$i
    sleep 1.5
done
