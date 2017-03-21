SystemJS.config({
  paths: {
    "npm:": "jspm_packages/npm/",
    "github:": "jspm_packages/github/",
    "talk/": "src/"
  },
  browserConfig: {
    "baseURL": "."
  },
  devConfig: {
    "map": {
      "plugin-babel": "npm:systemjs-plugin-babel@0.0.21"
    }
  },
  transpiler: "plugin-babel",
  packages: {
    "talk": {
      "main": "talk.js",
      "meta": {
        "*.js": {
          "loader": "plugin-babel"
        }
      }
    }
  }
});

SystemJS.config({
  packageConfigPaths: [
    "npm:@*/*.json",
    "npm:*.json",
    "github:*/*.json"
  ],
  map: {
    "assert": "npm:jspm-nodelibs-assert@0.2.0",
    "buffer": "npm:jspm-nodelibs-buffer@0.2.1",
    "child_process": "npm:jspm-nodelibs-child_process@0.2.0",
    "constants": "npm:jspm-nodelibs-constants@0.2.0",
    "crypto": "npm:jspm-nodelibs-crypto@0.2.0",
    "css": "github:systemjs/plugin-css@0.1.32",
    "events": "npm:jspm-nodelibs-events@0.2.0",
    "fs": "npm:jspm-nodelibs-fs@0.2.0",
    "hljs": "npm:highlight.js@9.0.0",
    "http": "npm:jspm-nodelibs-http@0.2.0",
    "https": "npm:jspm-nodelibs-https@0.2.1",
    "less": "npm:systemjs-less-plugin@2.0.0",
    "net": "npm:jspm-nodelibs-net@0.2.0",
    "os": "npm:jspm-nodelibs-os@0.2.0",
    "path": "npm:jspm-nodelibs-path@0.2.1",
    "process": "npm:jspm-nodelibs-process@0.2.0",
    "querystring": "npm:jspm-nodelibs-querystring@0.2.0",
    "reveal.js": "npm:reveal.js@3.4.1",
    "stream": "npm:jspm-nodelibs-stream@0.2.0",
    "string_decoder": "npm:jspm-nodelibs-string_decoder@0.2.0",
    "text": "github:systemjs/plugin-text@0.0.9",
    "tls": "npm:jspm-nodelibs-tls@0.2.0",
    "url": "npm:jspm-nodelibs-url@0.2.0",
    "util": "npm:jspm-nodelibs-util@0.2.1",
    "vm": "npm:jspm-nodelibs-vm@0.2.0",
    "zlib": "npm:jspm-nodelibs-zlib@0.2.2"
  },
  packages: {
    "npm:jspm-nodelibs-crypto@0.2.0": {
      "map": {
        "crypto-browserify": "npm:crypto-browserify@3.11.0"
      }
    },
    "npm:jspm-nodelibs-http@0.2.0": {
      "map": {
        "http-browserify": "npm:stream-http@2.6.3"
      }
    },
    "npm:jspm-nodelibs-buffer@0.2.1": {
      "map": {
        "buffer": "npm:buffer@4.9.1"
      }
    },
    "npm:crypto-browserify@3.11.0": {
      "map": {
        "inherits": "npm:inherits@2.0.3",
        "diffie-hellman": "npm:diffie-hellman@5.0.2",
        "pbkdf2": "npm:pbkdf2@3.0.9",
        "browserify-sign": "npm:browserify-sign@4.0.0",
        "randombytes": "npm:randombytes@2.0.3",
        "create-ecdh": "npm:create-ecdh@4.0.0",
        "public-encrypt": "npm:public-encrypt@4.0.0",
        "browserify-cipher": "npm:browserify-cipher@1.0.0",
        "create-hash": "npm:create-hash@1.1.2",
        "create-hmac": "npm:create-hmac@1.1.4"
      }
    },
    "npm:stream-http@2.6.3": {
      "map": {
        "inherits": "npm:inherits@2.0.3",
        "to-arraybuffer": "npm:to-arraybuffer@1.0.1",
        "xtend": "npm:xtend@4.0.1",
        "readable-stream": "npm:readable-stream@2.2.3",
        "builtin-status-codes": "npm:builtin-status-codes@3.0.0"
      }
    },
    "npm:jspm-nodelibs-url@0.2.0": {
      "map": {
        "url-browserify": "npm:url@0.11.0"
      }
    },
    "npm:buffer@4.9.1": {
      "map": {
        "isarray": "npm:isarray@1.0.0",
        "base64-js": "npm:base64-js@1.2.0",
        "ieee754": "npm:ieee754@1.1.8"
      }
    },
    "npm:pbkdf2@3.0.9": {
      "map": {
        "create-hmac": "npm:create-hmac@1.1.4"
      }
    },
    "npm:diffie-hellman@5.0.2": {
      "map": {
        "randombytes": "npm:randombytes@2.0.3",
        "bn.js": "npm:bn.js@4.11.6",
        "miller-rabin": "npm:miller-rabin@4.0.0"
      }
    },
    "npm:browserify-sign@4.0.0": {
      "map": {
        "create-hash": "npm:create-hash@1.1.2",
        "create-hmac": "npm:create-hmac@1.1.4",
        "inherits": "npm:inherits@2.0.3",
        "parse-asn1": "npm:parse-asn1@5.0.0",
        "bn.js": "npm:bn.js@4.11.6",
        "browserify-rsa": "npm:browserify-rsa@4.0.1",
        "elliptic": "npm:elliptic@6.4.0"
      }
    },
    "npm:public-encrypt@4.0.0": {
      "map": {
        "create-hash": "npm:create-hash@1.1.2",
        "randombytes": "npm:randombytes@2.0.3",
        "parse-asn1": "npm:parse-asn1@5.0.0",
        "bn.js": "npm:bn.js@4.11.6",
        "browserify-rsa": "npm:browserify-rsa@4.0.1"
      }
    },
    "npm:create-hmac@1.1.4": {
      "map": {
        "create-hash": "npm:create-hash@1.1.2",
        "inherits": "npm:inherits@2.0.3"
      }
    },
    "npm:create-hash@1.1.2": {
      "map": {
        "inherits": "npm:inherits@2.0.3",
        "sha.js": "npm:sha.js@2.4.8",
        "ripemd160": "npm:ripemd160@1.0.1",
        "cipher-base": "npm:cipher-base@1.0.3"
      }
    },
    "npm:jspm-nodelibs-stream@0.2.0": {
      "map": {
        "stream-browserify": "npm:stream-browserify@2.0.1"
      }
    },
    "npm:readable-stream@2.2.3": {
      "map": {
        "inherits": "npm:inherits@2.0.3",
        "isarray": "npm:isarray@1.0.0",
        "core-util-is": "npm:core-util-is@1.0.2",
        "string_decoder": "npm:string_decoder@0.10.31",
        "buffer-shims": "npm:buffer-shims@1.0.0",
        "process-nextick-args": "npm:process-nextick-args@1.0.7",
        "util-deprecate": "npm:util-deprecate@1.0.2"
      }
    },
    "npm:jspm-nodelibs-zlib@0.2.2": {
      "map": {
        "browserify-zlib": "npm:browserify-zlib@0.1.4"
      }
    },
    "npm:stream-browserify@2.0.1": {
      "map": {
        "inherits": "npm:inherits@2.0.3",
        "readable-stream": "npm:readable-stream@2.2.3"
      }
    },
    "npm:create-ecdh@4.0.0": {
      "map": {
        "bn.js": "npm:bn.js@4.11.6",
        "elliptic": "npm:elliptic@6.4.0"
      }
    },
    "npm:browserify-cipher@1.0.0": {
      "map": {
        "evp_bytestokey": "npm:evp_bytestokey@1.0.0",
        "browserify-des": "npm:browserify-des@1.0.0",
        "browserify-aes": "npm:browserify-aes@1.0.6"
      }
    },
    "npm:url@0.11.0": {
      "map": {
        "querystring": "npm:querystring@0.2.0",
        "punycode": "npm:punycode@1.3.2"
      }
    },
    "npm:browserify-zlib@0.1.4": {
      "map": {
        "readable-stream": "npm:readable-stream@2.2.3",
        "pako": "npm:pako@0.2.9"
      }
    },
    "npm:sha.js@2.4.8": {
      "map": {
        "inherits": "npm:inherits@2.0.3"
      }
    },
    "npm:parse-asn1@5.0.0": {
      "map": {
        "browserify-aes": "npm:browserify-aes@1.0.6",
        "create-hash": "npm:create-hash@1.1.2",
        "evp_bytestokey": "npm:evp_bytestokey@1.0.0",
        "pbkdf2": "npm:pbkdf2@3.0.9",
        "asn1.js": "npm:asn1.js@4.9.1"
      }
    },
    "npm:browserify-rsa@4.0.1": {
      "map": {
        "bn.js": "npm:bn.js@4.11.6",
        "randombytes": "npm:randombytes@2.0.3"
      }
    },
    "npm:cipher-base@1.0.3": {
      "map": {
        "inherits": "npm:inherits@2.0.3"
      }
    },
    "npm:evp_bytestokey@1.0.0": {
      "map": {
        "create-hash": "npm:create-hash@1.1.2"
      }
    },
    "npm:browserify-aes@1.0.6": {
      "map": {
        "cipher-base": "npm:cipher-base@1.0.3",
        "create-hash": "npm:create-hash@1.1.2",
        "evp_bytestokey": "npm:evp_bytestokey@1.0.0",
        "inherits": "npm:inherits@2.0.3",
        "buffer-xor": "npm:buffer-xor@1.0.3"
      }
    },
    "npm:browserify-des@1.0.0": {
      "map": {
        "cipher-base": "npm:cipher-base@1.0.3",
        "inherits": "npm:inherits@2.0.3",
        "des.js": "npm:des.js@1.0.0"
      }
    },
    "npm:miller-rabin@4.0.0": {
      "map": {
        "bn.js": "npm:bn.js@4.11.6",
        "brorand": "npm:brorand@1.1.0"
      }
    },
    "npm:elliptic@6.4.0": {
      "map": {
        "bn.js": "npm:bn.js@4.11.6",
        "inherits": "npm:inherits@2.0.3",
        "minimalistic-assert": "npm:minimalistic-assert@1.0.0",
        "brorand": "npm:brorand@1.1.0",
        "hash.js": "npm:hash.js@1.0.3",
        "hmac-drbg": "npm:hmac-drbg@1.0.0",
        "minimalistic-crypto-utils": "npm:minimalistic-crypto-utils@1.0.1"
      }
    },
    "npm:jspm-nodelibs-os@0.2.0": {
      "map": {
        "os-browserify": "npm:os-browserify@0.2.1"
      }
    },
    "npm:asn1.js@4.9.1": {
      "map": {
        "bn.js": "npm:bn.js@4.11.6",
        "inherits": "npm:inherits@2.0.3",
        "minimalistic-assert": "npm:minimalistic-assert@1.0.0"
      }
    },
    "npm:des.js@1.0.0": {
      "map": {
        "inherits": "npm:inherits@2.0.3",
        "minimalistic-assert": "npm:minimalistic-assert@1.0.0"
      }
    },
    "npm:hash.js@1.0.3": {
      "map": {
        "inherits": "npm:inherits@2.0.3"
      }
    },
    "npm:hmac-drbg@1.0.0": {
      "map": {
        "hash.js": "npm:hash.js@1.0.3",
        "minimalistic-crypto-utils": "npm:minimalistic-crypto-utils@1.0.1",
        "minimalistic-assert": "npm:minimalistic-assert@1.0.0"
      }
    },
    "npm:jspm-nodelibs-string_decoder@0.2.0": {
      "map": {
        "string_decoder-browserify": "npm:string_decoder@0.10.31"
      }
    },
    "npm:reveal.js@3.4.1": {
      "map": {
        "grunt-cli": "npm:grunt-cli@1.2.0",
        "express": "npm:express@4.14.1",
        "socket.io": "npm:socket.io@1.7.3",
        "mustache": "npm:mustache@2.2.1"
      }
    },
    "npm:grunt-cli@1.2.0": {
      "map": {
        "grunt-known-options": "npm:grunt-known-options@1.1.0",
        "nopt": "npm:nopt@3.0.6",
        "resolve": "npm:resolve@1.1.7",
        "findup-sync": "npm:findup-sync@0.3.0"
      }
    },
    "npm:express@4.14.1": {
      "map": {
        "content-disposition": "npm:content-disposition@0.5.2",
        "array-flatten": "npm:array-flatten@1.1.1",
        "escape-html": "npm:escape-html@1.0.3",
        "finalhandler": "npm:finalhandler@0.5.1",
        "parseurl": "npm:parseurl@1.3.1",
        "on-finished": "npm:on-finished@2.3.0",
        "cookie-signature": "npm:cookie-signature@1.0.6",
        "fresh": "npm:fresh@0.3.0",
        "accepts": "npm:accepts@1.3.3",
        "merge-descriptors": "npm:merge-descriptors@1.0.1",
        "debug": "npm:debug@2.2.0",
        "depd": "npm:depd@1.1.0",
        "encodeurl": "npm:encodeurl@1.0.1",
        "etag": "npm:etag@1.7.0",
        "cookie": "npm:cookie@0.3.1",
        "content-type": "npm:content-type@1.0.2",
        "methods": "npm:methods@1.1.2",
        "send": "npm:send@0.14.2",
        "path-to-regexp": "npm:path-to-regexp@0.1.7",
        "qs": "npm:qs@6.2.0",
        "proxy-addr": "npm:proxy-addr@1.1.3",
        "vary": "npm:vary@1.1.0",
        "type-is": "npm:type-is@1.6.14",
        "serve-static": "npm:serve-static@1.11.2",
        "range-parser": "npm:range-parser@1.2.0",
        "utils-merge": "npm:utils-merge@1.0.0"
      }
    },
    "npm:socket.io@1.7.3": {
      "map": {
        "debug": "npm:debug@2.3.3",
        "object-assign": "npm:object-assign@4.1.0",
        "socket.io-client": "npm:socket.io-client@1.7.3",
        "engine.io": "npm:engine.io@1.8.3",
        "has-binary": "npm:has-binary@0.1.7",
        "socket.io-adapter": "npm:socket.io-adapter@0.5.0",
        "socket.io-parser": "npm:socket.io-parser@2.3.1"
      }
    },
    "npm:finalhandler@0.5.1": {
      "map": {
        "escape-html": "npm:escape-html@1.0.3",
        "on-finished": "npm:on-finished@2.3.0",
        "debug": "npm:debug@2.2.0",
        "statuses": "npm:statuses@1.3.1",
        "unpipe": "npm:unpipe@1.0.0"
      }
    },
    "npm:send@0.14.2": {
      "map": {
        "depd": "npm:depd@1.1.0",
        "encodeurl": "npm:encodeurl@1.0.1",
        "escape-html": "npm:escape-html@1.0.3",
        "etag": "npm:etag@1.7.0",
        "fresh": "npm:fresh@0.3.0",
        "on-finished": "npm:on-finished@2.3.0",
        "range-parser": "npm:range-parser@1.2.0",
        "debug": "npm:debug@2.2.0",
        "statuses": "npm:statuses@1.3.1",
        "destroy": "npm:destroy@1.0.4",
        "mime": "npm:mime@1.3.4",
        "ms": "npm:ms@0.7.2",
        "http-errors": "npm:http-errors@1.5.1"
      }
    },
    "npm:serve-static@1.11.2": {
      "map": {
        "encodeurl": "npm:encodeurl@1.0.1",
        "escape-html": "npm:escape-html@1.0.3",
        "parseurl": "npm:parseurl@1.3.1",
        "send": "npm:send@0.14.2"
      }
    },
    "npm:socket.io-adapter@0.5.0": {
      "map": {
        "debug": "npm:debug@2.3.3",
        "socket.io-parser": "npm:socket.io-parser@2.3.1"
      }
    },
    "npm:socket.io-parser@2.3.1": {
      "map": {
        "debug": "npm:debug@2.2.0",
        "isarray": "npm:isarray@0.0.1",
        "json3": "npm:json3@3.3.2",
        "component-emitter": "npm:component-emitter@1.1.2"
      }
    },
    "npm:findup-sync@0.3.0": {
      "map": {
        "glob": "npm:glob@5.0.15"
      }
    },
    "npm:nopt@3.0.6": {
      "map": {
        "abbrev": "npm:abbrev@1.1.0"
      }
    },
    "npm:engine.io@1.8.3": {
      "map": {
        "accepts": "npm:accepts@1.3.1",
        "debug": "npm:debug@2.2.0",
        "ws": "npm:ws@1.0.1",
        "base64id": "npm:base64id@0.1.0",
        "engine.io-parser": "npm:engine.io-parser@1.2.4"
      }
    },
    "npm:socket.io-client@1.7.3": {
      "map": {
        "has-binary": "npm:has-binary@0.1.7",
        "debug": "npm:debug@2.3.3",
        "socket.io-parser": "npm:socket.io-parser@2.3.1",
        "component-emitter": "npm:component-emitter@1.2.1",
        "backo2": "npm:backo2@1.0.2",
        "indexof": "npm:indexof@0.0.1",
        "to-array": "npm:to-array@0.1.4",
        "component-bind": "npm:component-bind@1.0.0",
        "object-component": "npm:object-component@0.0.3",
        "parseuri": "npm:parseuri@0.0.5",
        "engine.io-client": "npm:engine.io-client@1.8.3"
      }
    },
    "npm:accepts@1.3.3": {
      "map": {
        "negotiator": "npm:negotiator@0.6.1",
        "mime-types": "npm:mime-types@2.1.14"
      }
    },
    "npm:type-is@1.6.14": {
      "map": {
        "mime-types": "npm:mime-types@2.1.14",
        "media-typer": "npm:media-typer@0.3.0"
      }
    },
    "npm:on-finished@2.3.0": {
      "map": {
        "ee-first": "npm:ee-first@1.1.1"
      }
    },
    "npm:proxy-addr@1.1.3": {
      "map": {
        "forwarded": "npm:forwarded@0.1.0",
        "ipaddr.js": "npm:ipaddr.js@1.2.0"
      }
    },
    "npm:debug@2.3.3": {
      "map": {
        "ms": "npm:ms@0.7.2"
      }
    },
    "npm:debug@2.2.0": {
      "map": {
        "ms": "npm:ms@0.7.1"
      }
    },
    "npm:has-binary@0.1.7": {
      "map": {
        "isarray": "npm:isarray@0.0.1"
      }
    },
    "npm:accepts@1.3.1": {
      "map": {
        "negotiator": "npm:negotiator@0.6.0",
        "mime-types": "npm:mime-types@2.1.14"
      }
    },
    "npm:http-errors@1.5.1": {
      "map": {
        "statuses": "npm:statuses@1.3.1",
        "inherits": "npm:inherits@2.0.3",
        "setprototypeof": "npm:setprototypeof@1.0.2"
      }
    },
    "npm:engine.io-parser@1.2.4": {
      "map": {
        "has-binary": "npm:has-binary@0.1.6",
        "after": "npm:after@0.8.1",
        "arraybuffer.slice": "npm:arraybuffer.slice@0.0.6",
        "base64-arraybuffer": "npm:base64-arraybuffer@0.1.2",
        "blob": "npm:blob@0.0.4",
        "utf8": "npm:utf8@2.1.0"
      }
    },
    "npm:glob@5.0.15": {
      "map": {
        "inflight": "npm:inflight@1.0.6",
        "once": "npm:once@1.4.0",
        "path-is-absolute": "npm:path-is-absolute@1.0.1",
        "inherits": "npm:inherits@2.0.3",
        "minimatch": "npm:minimatch@3.0.3"
      }
    },
    "npm:engine.io-client@1.8.3": {
      "map": {
        "engine.io-parser": "npm:engine.io-parser@1.3.2",
        "ws": "npm:ws@1.1.2",
        "node-ws": "npm:ws@1.1.2",
        "component-emitter": "npm:component-emitter@1.2.1",
        "debug": "npm:debug@2.3.3",
        "indexof": "npm:indexof@0.0.1",
        "parseuri": "npm:parseuri@0.0.5",
        "component-inherit": "npm:component-inherit@0.0.3",
        "has-cors": "npm:has-cors@1.1.0",
        "parsejson": "npm:parsejson@0.0.3",
        "yeast": "npm:yeast@0.1.2",
        "xmlhttprequest-ssl": "npm:xmlhttprequest-ssl@1.5.3",
        "node-xmlhttprequest-ssl": "npm:xmlhttprequest-ssl@1.5.3",
        "parseqs": "npm:parseqs@0.0.5"
      }
    },
    "npm:mime-types@2.1.14": {
      "map": {
        "mime-db": "npm:mime-db@1.26.0"
      }
    },
    "npm:has-binary@0.1.6": {
      "map": {
        "isarray": "npm:isarray@0.0.1"
      }
    },
    "npm:inflight@1.0.6": {
      "map": {
        "once": "npm:once@1.4.0",
        "wrappy": "npm:wrappy@1.0.2"
      }
    },
    "npm:engine.io-parser@1.3.2": {
      "map": {
        "has-binary": "npm:has-binary@0.1.7",
        "after": "npm:after@0.8.2",
        "arraybuffer.slice": "npm:arraybuffer.slice@0.0.6",
        "base64-arraybuffer": "npm:base64-arraybuffer@0.1.5",
        "blob": "npm:blob@0.0.4",
        "wtf-8": "npm:wtf-8@1.0.0"
      }
    },
    "npm:parseuri@0.0.5": {
      "map": {
        "better-assert": "npm:better-assert@1.0.2"
      }
    },
    "npm:ws@1.0.1": {
      "map": {
        "options": "npm:options@0.0.6",
        "ultron": "npm:ultron@1.0.2",
        "utf-8-validate": "npm:utf-8-validate@1.2.2",
        "bufferutil": "npm:bufferutil@1.2.1"
      }
    },
    "npm:ws@1.1.2": {
      "map": {
        "options": "npm:options@0.0.6",
        "ultron": "npm:ultron@1.0.2",
        "utf-8-validate": "npm:utf-8-validate@1.2.2",
        "bufferutil": "npm:bufferutil@1.2.1"
      }
    },
    "npm:once@1.4.0": {
      "map": {
        "wrappy": "npm:wrappy@1.0.2"
      }
    },
    "npm:minimatch@3.0.3": {
      "map": {
        "brace-expansion": "npm:brace-expansion@1.1.6"
      }
    },
    "npm:parsejson@0.0.3": {
      "map": {
        "better-assert": "npm:better-assert@1.0.2"
      }
    },
    "npm:parseqs@0.0.5": {
      "map": {
        "better-assert": "npm:better-assert@1.0.2"
      }
    },
    "npm:better-assert@1.0.2": {
      "map": {
        "callsite": "npm:callsite@1.0.0"
      }
    },
    "npm:bufferutil@1.2.1": {
      "map": {
        "nan": "npm:nan@2.5.1",
        "bindings": "npm:bindings@1.2.1"
      }
    },
    "npm:utf-8-validate@1.2.2": {
      "map": {
        "nan": "npm:nan@2.4.0",
        "bindings": "npm:bindings@1.2.1"
      }
    },
    "npm:brace-expansion@1.1.6": {
      "map": {
        "balanced-match": "npm:balanced-match@0.4.2",
        "concat-map": "npm:concat-map@0.0.1"
      }
    },
    "npm:systemjs-less-plugin@2.0.0": {
      "map": {
        "css": "github:systemjs/plugin-css@0.1.32"
      }
    }
  }
});
