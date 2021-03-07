set -e

# Unfortunately, the GitHub Actions Marketplace strips out all Git details (including submodules) on publish, so we have to re-clone our own repository to get the KiCAD submodule we plan to build.

mkdir clone
cd clone

git init
git remote add origin https://github.com/$NEOMURA_SETUP_KICAD_CLI_ACTION_REPOSITORY
git fetch origin $NEOMURA_SETUP_KICAD_CLI_ACTION_REF:temp

echo ::set-output name=sha::$(git rev-parse temp)

if [ "$(uname)" == "Darwin" ]; then
  echo TODO
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  wget --output-document=get_libngspice_so.sh https://gitlab.com/kicad/code/kicad/-/raw/master/scripting/build_tools/get_libngspice_so.sh?inline=false
  chmod +x ./get_libngspice_so.sh
  ./get_libngspice_so.sh install

  sudo apt-get install ninja-build libglew-dev libglm-dev libcurl4-openssl-dev libboost-dev -y
else
  echo TODO
fi
