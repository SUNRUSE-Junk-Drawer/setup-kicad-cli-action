set -e

cd clone
git checkout temp

git submodule update --init --recursive --depth 1 submodules/kicad/code

cd submodules/kicad/code

mkdir -p build/release

if [ "$(uname)" == "Darwin" ]; then
  echo TODO
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ../../
  make -j 4
else
  echo TODO
fi
