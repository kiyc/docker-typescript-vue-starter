#!/bin/ash

rc-service nginx start
cd /ts-vue && npm run watch &
node
