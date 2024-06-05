# CLI Development in TypeScript

###### Having Fun Creating a CLI for a Simple Task

Hello, hello, hello!

I really wanted to keep this blog updated, writing tech stuff and so on, but believe me, when your main source of income is being a chef running a kitchen at a hotel, which is an iconic establishment in a small, charming town in the south of Iceland, your writing resources get drained.

Writing articles is not like writing code. In fact, since my last post, I have written a lot of TypeScript and Rust, and I have reached the point where it’s time to share it with you.

## Prerequisites.

- [Node.js](https://nodejs.org/): A JavaScript runtime built on Chrome's V8 JavaScript engine.
- [TypeScript](https://www.typescriptlang.org/): A strongly typed programming language that builds on JavaScript.
- [Git](https://git-scm.com/): A distributed version control system to track changes in your code.
- Linux or macOS: Unix-like operating systems. Node.js development is commonly done on these systems.
- An IDE or any text editor of your choice. Some popular open-source options include: 
  -   [Neovim](https://neovim.io/)
  - [Vim](https://www.vim.org/)
  - [Visual Studio Code](https://code.visualstudio.com/)
  - [Zed](https://zed.dev/) (for macOS)

I assume that you have knowledge on how to install and set up your environment.

## A bit of the thing.

The library I'm going to introduce you, can be cloned at the address

[@ivy-industries/input](https://github.com/ivy-industries/input): Ivy Framework to build CLI applications. esModule.

I'm the founder of _Ivy-Industries_, a _small startup_ dedicated to creating web application software that connects people and ideas. Just like _ivy_, resilient and adaptable, my goal is to build a network that helps everyone thrive.

Everyone is welcome to _contribute_ to the _codebase_, growing the _community_, and last but not least, _funding_ the project on _GitHub_.

[fund](https://github.com/sponsors/ivy-industries): _GitHub Sponsors_

## Let's give it a try.

> this software and related software is absolutely NOT ready for production. I'm just sharing what I have done in the last few months.

The repo is just a boilerplate for a Node.js application with a few scripts and devDependencies and a TypeScript config file ready to go.  
You won't find code in the repository, but by following this tutorial, you will build a fun CLI application from scratch.

```shell
# this command will clone the repo into the directory fun, change it if you want
git clone https://github.com/nutsloop/cli-lib-introduction.git fun
#simply go into the `fun` direcotry, install and compile/watch
cd fun && npm install && npm run tsc-watch
```

With the above command, you'll install the dependencies and run `tsc-watch` to compile on every save of the files. It will also give execution privileges to the binary of our fun CLI application.

It's time to open your favorite editor, but before we dive into this fun CLI application, I want you to have a look at the **package.json** file.

_I'll comment to explain some keys that you should modify to make the app more "**your app**._"

```json
{
  // give it a name
  "name": "@nutsloop/cli-lib-introduction",
  "version": "1.0.0",
  // you may like to use another license
  "license": "Apache-2.0",
  // give it a description
  "description": "CLI Development in TypeScript",
  // this CANNOT be changed
  "type": "module",
  // required by the library, you'll get a warning if not set to this version
  // nothing serious anyway.
  "engines": {
    "node": ">=20.0.0"
  },
  // the @ivy-industries/input library has not been tested on Windows.
  // and I believe it won't work.
  "os": [
    "!win32"
  ],
  "main": "index.js",
  "bin": {
	// `npx fun` will run the CLI application
    "fun": "./bin/fun.js"
  },
  "types": "./types/index.d.ts",
  "files": [
    "bin",
    "lib",
    "index.js",
    "types"
  ],
  "publishConfig": {
    "access": "public"
  },
  "scripts": {
    "build": "npx tsc",
    // delete the build and node_modules
    "clean": "./scripts/clean.sh",
    // watch and make the ./bin/fun.js file executable.
    "tsc-watch": "npx tsc-watch --onSuccess \"sh ./scripts/chmod.u+x.sh\""
  },
  "dependencies": {
	// the library
    "@ivy-industries/input": "^1.0.0-alpha.2"
  },
  "devDependencies": {
    "@types/node": "^20.14.0",
    "typescript": "^5.4.5",
    // more info @ https://www.npmjs.com/package/tsc-watch
    "tsc-watch": "^6.2.0"
  },
  // you may change these
  "keywords": [
    "cli",
    "typescript",
    "library",
    "nutsloop",
    "blog",
    "post"
  ],
  // you may change these information
  "author": {
    "name": "nutsloop",
    "email": "nutsloop@proton.me",
    "url": "https://github.com/nutsloop"
  },
  // you may change/remove this
  "funding": [
    {
      "type": "github",
      "url": "https://github.com/sponsors/ivy-industries"
    }
  ],
  // you may change this
  "homepage": "https://github.com/nutsloop/cli-lib-introduction#readme",
  // you may change this
  "repository": {
    "type": "git",
    "url": "git+https://github.com/nutsloop/cli-lib-introduction.git"
  }
}
```

Ok then, open the file **./src/bin/fun.ts**

```TypeScript
#!/usr/bin/env -S node
import { entry_point } from '../lib/main.js';

/**
 * entry point of the fun CLI, the actual executable file.
 */
await entry_point()
  .catch( console.error );

```

this is it our executable file ready nothing else into it. save it. and let's go to the next step were we are going to actual use the library.

open the file **./src/lib/main.ts** 

This file contains all the code we need to execute few simple tasks.

```TypeScript

import type { CLILogic, ParsedArgv } from '@ivy-industries/input';
import { cli, run, set_global_flag_declaration } from '@ivy-industries/input';
import { command, flag, global } from '@ivy-industries/input';
import { set_cli_info_specification } from '@ivy-industries/input';
import type { CallBackArgvData, CallBackAsync } from '@ivy-industries/input';
import type { CallBackGlobalFlag } from '@ivy-industries/input';
import type { CallBackFlag } from '@ivy-industries/input';
```

