set -e

cd clone
git checkout temp

git submodule update --init --recursive --depth 1 submodules/kicad/code/kicad

cd submodules/kicad/code/kicad

cd scripting/build_tools
scripting/build_tools/get_libngspice_so.sh
sudo scripting/build_tools/get_libngspice_so.sh install
cd ../..

mkdir -p build/release
cd build/release

if [ "$(uname)" == "Darwin" ]; then
  echo TODO
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo ../../
  ninja
else
  echo TODO
fi
