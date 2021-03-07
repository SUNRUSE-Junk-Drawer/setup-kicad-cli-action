set -e

cd clone
git checkout temp

git submodule update --init --recursive --depth 1 submodules/kicad/code/kicad

cd submodules/kicad/code/kicad

mkdir -p build/release

cd build/release

if [ "$(uname)" == "Darwin" ]; then
  echo TODO
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ../../
  make -j 4
else
  echo TODO
fi
