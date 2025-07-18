![desktop](screenshot_01.png)

# Description 

This repo represents uniform structure that describes software/hardware configuration files based
on nix package manager, flakes and home-manager. 
It unlocks ability to reproduce my personalized setup on any linux/darwin based host without any time-consuming hassle.

## Motivation
Setting up your favorite environment on new machine is a time-consuming task,
but to keep them all in sync is even more time-consuming,
eventually I got tired of doing again and again until I found NixOS, and it's declarative ecosystem.
It's a big pleasure to be able to define the whole system configuration
such as hardware and software in one repo.

## Software

List of software that I prefer in my daily life and work workflows, I prefer to use software
written in languages that understand, so I can explore those solutions and contribute if needed.
Also, I'm huge fan of rust written apps I and believe there is no better alternative right now.

### TUI

| name     | description            | language |
|----------|------------------------|----------|
| tuigreet | console greeter        | rust     |
| ghostty  | terminal emulator      | zig      |
| nushell  | shell                  | rust     |
| starship | cross-shell prompt     | rust     |
| btop     | a monitor of resources | c++      |
| yazi     | terminal file manager  | rust     |
| p7zip    | file archiver          | rust     |

### GUI

| name    | description                               | language |
|---------|-------------------------------------------|----------|
| niri    | scrollable-tiling wayland compositor      | rust     |
| ironbar | gtk bar for wayland                       | rust     |
| fuzzel  | app launcher and fuzzy finder for wayland | c        |
| pcmanfm | file manager                              | c        |

### Development

| name          | description                            | language |
|---------------|----------------------------------------|----------|
| helix         | post-modern vim-like modal text editor | rust     |
| intellij idea | java ide                               | java     |
| zed           | rust ide                               | rust     |

### Other

| name             | description        | language   |
|------------------|--------------------|------------|
| stylix           | theming            | nix        |
| telegram-desktop | messenger          | c++        |
| discord          | messenger          | javascript |
| google-chrome    | browser            | c/c++      |
| gimp3            | image manipulation | c          |
| obsidian         | note taking        | javascript |
| berkeley-mono    | font               |            |
| nerd-icons       | icons              |            |


## Hardware

For personal use I have dell laptop with nixos, for work I have a macbook pro,
so this config support darwin targets via nix-darwin.

## Keybinds

Here I will list my keybinds across all the programs, so I can easily look them up later
and perform some analysis on how create non-intersecting layouts for different programs.


# Prerequisites
* nix package manager
* nix-darwing (for darwin)
* flakes enabled
* root access

# Getting Started

## Installation

```shell
git clone git@github.com:nanobreaker/nix-config.git ~/.config/nix-config
```

## Check
```shell
nix flake check
```

## Build

#### Linux 
```shell
sudo nixos-rebuild switch --flake .#nixos
```

### Darwin
```shell
sudo darwin-rebuild switch --flake .#darwin
```

# Licensing
The code in this project is licensed under MIT license. Check [LICENSE](LICENSE) for further
details.