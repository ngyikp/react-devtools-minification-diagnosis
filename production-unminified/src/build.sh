#!/bin/bash

npm install react react-dom browserify envify uglify-js

NODE_ENV=production ./node_modules/.bin/browserify script.js -t envify | ./node_modules/.bin/uglifyjs > out.js

# NODE_ENV=production ./node_modules/.bin/uglifyjs out.js -c -m > uglified.js
