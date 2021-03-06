# neomura/setup-kicad-cli-action

GitHub Action to build and install the KiCAD CLI.

## License

While this repository is [MIT licensed](./license.md), it includess Git submodules of:

- [KiCAD](https://gitlab.com/kicad/code/kicad), which uses the GPLv3 license.
- [OCE](https://github.com/tpaviot/oce), which uses the lGPL license.

You should make your own checks to ensure that your usage of this GitHub action is valid within these license agreements.

## Supported virtual environments

Supported virtual environments are listed in the [test workflow](./.github/workflows/test.yaml).

## Usage

```yaml
on: [push]

jobs:
  example:
    runs-on: ubuntu-latest
    steps:

    # Load your repository.
    - uses: actions/checkout@v2

    # Install this github action.
    - uses: neomura/setup-kicad-cli-action@v0.0.0

    # KiCAD is now available on the path.
    - run: pcbnew --help
      shell: bash
```
