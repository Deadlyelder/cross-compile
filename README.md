# cross-compile

cross-compile is my clumsy attempt at creating a cross-compiler for a Debian based system
from start. The script is a trail attempt and is likely to cause breakdown of a working machine, as such
its highly recommended that you execute the script within an isolated environment.

The plan is to use this cross-compiler as base for planned future projects. Currently it is only to serve its purpose i.e. its a quick and dirty script restricted in its functionalities; might make it more robust in future.

## How it works

Building a cross-compiler is relatively easy task, although as was realized later on that if its not done with care, it can led to lots of wasted time.
The script in the repo is pretty much self explanatory and has been successfully tested on the following systems:

* Ubuntu 14.04
* Ubuntu 16.04

## Credits

Credits to the blogpost and wiki referred in the later section.

## License

[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

## References

1. [How to build a gcc cross compiler](http://preshing.com/20141119/how-to-build-a-gcc-cross-compiler/) Preshing of Programming Blog post
2. [GCC Cross-Compiler](http://wiki.osdev.org/GCC_Cross-Compiler) OSDev.org
