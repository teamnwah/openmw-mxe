# OpenMW MXE

OpenMW MXE is a small project which sets up a Linux build environment for
Windows, by using MinGW and [mxe](https://mxe.cc).

Building all dependencies may easily take 2-3 hours, it is recommend to cache.
Building only `openmw` after that takes about ~30s on 0.44

`mxe.src` gets used as overlay for the normal mxe repository

## Requirements

`sh` should be set to `bash` (otherwise `openexs` will build with a wrong config, with the result that it uses the namespace `yes` instead of `Imf`)

Other requirements can be found on the mxe site: https://mxe.cc/#requirements

## Running

```sh
git clone --recursive https://github.com/teamnwah/openmw-mxe.git
cd $_
./nwah mxe openmw
```
