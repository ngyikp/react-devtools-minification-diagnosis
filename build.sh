#!/bin/bash

wget -O development/react.development.js https://unpkg.com/react@16.8.4/umd/react.development.js
wget -O development/react-dom.development.js https://unpkg.com/react-dom@16.8.4/umd/react-dom.development.js

wget -O production/react.production.min.js https://unpkg.com/react@16.8.4/umd/react.production.min.js
wget -O production/react-dom.production.min.js https://unpkg.com/react-dom@16.8.4/umd/react-dom.production.min.js

npm install

NODE_ENV=production ./node_modules/.bin/browserify deadcode/script.js -t envify | ./node_modules/.bin/uglifyjs > deadcode/out.js
# NODE_ENV=production ./node_modules/.bin/uglifyjs out.js -c -m > uglified.js

pushd unminified
npm install
NODE_ENV=production ./node_modules/.bin/browserify script.js -t envify | ./node_modules/.bin/uglifyjs > out.js
popd
