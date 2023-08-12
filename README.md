# homelab

Scripts and whatnot to bootstrap a homelab.

## Bootstrapping macOS

Install homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install git:

```sh
brew install git
```

Clone this repo:

```sh
git clone https://github.com/wernerstrydom/homelab.git
cd homelab
```

Run the bootstrap script:

```sh
cd macos
./bootstrap.sh
```

### After Bootstrapping

You'll need to manually do the following:

1. Configure 1Password
2. Install JetBrains IDEs using JetBrains Toolbox 



