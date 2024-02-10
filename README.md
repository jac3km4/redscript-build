# redscript-build
Build script for redscript scc_lib.dll with PGO.
It's about 5-10% faster than a standard release build.

# usage
```ps1
git clone --recurse-submodules https://github.com/jac3km4/redscript-build.git

cd redscript-build

# will download ./data/cache/final.redscripts if it doesn't exist
# you can populate it yourself
.\build.ps1
```
