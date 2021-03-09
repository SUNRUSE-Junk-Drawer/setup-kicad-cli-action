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
  sudo apt-get install tk-dev ninja-build libglew-dev libglm-dev libcurl4-openssl-dev libboost-dev libxi-dev libgtk-3-dev libwxgtk3.0-gtk3-dev python-wxgtk3.0-dev python-dev python3-dev libboost-test-dev libboost-filesystem-dev -y
else
  echo TODO
fi
