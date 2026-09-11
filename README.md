cline-tui-formula
==================

A SaltStack formula designed to install and configure the [CLIne coding-assistant package](https://cline.bot/) on installation-targets.

It is primarily expected that this formula will be run via [P3](https://www.plus3it.com/)'s "[watchmaker](https://watchmaker.readthedocs.io/en/stable/)" framework.

This formula is able to install the CLIne coding-assistant utility on Linux and Windows Server operating environments. Installation for internet-connected systems may be done using:
* Vendor-provided installation-scripts
* NPM-based install

The CLIne coding-assistant updates _frequently_. Sites that wish to use a specific version of the CLIne coding-assistant will need to specifically-target that associated install-content, possibly even to the degree that they will need to self-host it.

Targeting specific versions of the CLIne coding-assistant or local copies of the install-archives can be directed to do so by adding appropriate content to the formula's associated Pillar-data (see this projct's [pillar.example](pillar.example) file for guidance).


## Available states

- [cline-tui](#cline-tui)
- [cline-tui.clean](#cline-tui.clean)
- [cline-tui.package](#cline-tui.package)
- [cline-tui.package.clean](#cline-tui.package.clean)
- [cline-tui.config](#cline-tui.config)
- [cline-tui.config.clean](#cline-tui.config.clean)

### cline-tui

Executes the `package` and `config` states to install and configure the CLIne coding-assistant

### cline-tui.clean

Executes the `package` and `config` states' `clean` actions to fully uninstall the CLIne coding-assistant and remove previously-installed configuration files/settings (and, on Windows, associated registry entries)

### cline-tui.package

Executes _just_ the `package` state to install the CLIne coding-assistant package.

### cline-tui.package.clean

Executes _just_ the `package.clean` state to uninstall the CLIne coding-assistant package.

### cline-tui.config

Executes _just_ the `config` state to install/configure the CLIne coding-assistant client-configuration (etc.) files

### cline-tui.config.clean

Executes _just_ the `config` state to uninstall the CLIne coding-assistant client-configuration (etc.) files and, on Windows, remove any registry-keys set by prior install-runs of the formula.

## Compatibility Notes:


### Linux



### Windows

