# dotfiles - nightlyte 🌙

My dotfiles!!! 🤟🤟🤟

# Introduction

This repo is a hub for all of my configuration files, customizations, and random fixes I've collected from various sources and use daily across all of my devices.

A defining feature of who I am is that I am permanently stuck in a state of improvement. For example, I'll sometimes spend days, weeks, or even months obsessively configuring a program or tool I've found (*cough* mpv *cough*). But even once I reach a point where every option is configured, the theme is customized, and every keybind is key-bound, I'll still wake up the next day looking for something better to replace it. 

With some exceptions, every file in this repo should be treated as *ephemeral* and *transitory*. If you like any of these files as they exist today, I encourage you to fork the repo and customize to your liking ❤️

## Other Projects

**⚠️In Development⚠️**

[f0rge](https://github.com/nightlyte-dev/f0rge.git) —  An (Upgraded) Arch Linux System Crafting Tool
```
    ░████   ░████                                  
   ░██     ░██ ░██                                 
░████████ ░██ ░████ ░██░████  ░████████  ░███████  
   ░██    ░██░██░██ ░███     ░██    ░██ ░██    ░██ 
   ░██    ░████ ░██ ░██      ░██    ░██ ░█████████ 
   ░██     ░██ ░██  ░██      ░██   ░███ ░██        
   ░██      ░████   ░██       ░█████░██  ░███████  
                                    ░██            
                              ░███████             
```

# How it's organized

## The `stow`-able stuff

Many of the folders here are meant to be used with [GNU Stow](https://www.gnu.org/software/stow/), which makes implementing these config files ezpz since each folder's internal layout mirrors the `$HOME` directory.

### Usage

>[!WARNING]
>If these folders and files already exist, move/rename them before running stow.
>```sh
>mv ~/.config/mpv ~/.config/mpv.bak
>```

Clone the repo into your `$HOME` directory and navigate to the repo folder:

```sh
git clone --recurse-submodules https://github.com/nightlyte-dev/dotfiles.git ~/dotfiles && cd ~/dotfiles
```

Then use the `stow` command to symlink the config(s) you want to use:

```sh ~/dotfiles/
# Single folder
stow mpv

# Multiple folders
stow fish ghostty mpv nvim starship yazi hyprland
```

### List of all stowable folders:

**Actively being used:**
- fish
- ghostty
- mpv
- nvim
- starship
- yazi

**In Development:**
- hyprland

**Not Actively Using/Discontinued:**
- zshrc

## The "everything else" stuff

The rest of the folders reference material and system-level config files that either live outside `$HOME` or that need to be copied/applied by hand:

- **`browser-config`** — Firefox/LibreWolf/Chrome themes (Gruvbox Material, obviously), extension setting exports, and an `extension-list.md` cheat sheet of what to install + which `about:config` flags to flip.
- **`keyd`** — remaps for `/etc/keyd/`
    - `default.conf` turns Capslock into a proper Meta layer (RIP BOZO 🤣💀) and includes optional personal remaps for my HHKB Pro Hybrid Type-S
    - `razernagav2pro.conf` is for my Razer Naga in order to make use of all 12 buttons (currently for KDE Plasma Shortcuts and KZones)
- **`kde-plasma-6`** — exported KDE shortcut bindings.
- **`kwin/kzones`** — window-tiling layouts for the KZones KWin script.
- **`obsidian`** — a Gruvbox Material theme for my Obsidian vault, drop into `{VAULT_FOLDER}/.obsidian/themes/`.
- **`powershell`** — profile + oh-my-posh themes, for the rare occasions I'm stuck on Windows.
- **`scripts`** — small standalone utilities, currently just an AHKv2 script for hiding the Windows taskbar (see above: rare occasions).

## Notes

- **nvim** — [LazyVim](https://lazyvim.github.io) under the hood, my stuff layered on top in `lua/config/` and `lua/plugins/`.
- **mpv** — This program has consumed many hours of my life and this config has gotten *out of hand*. Includes a plethora of Lua scripts for the OSC, playlist management, crop/encode, AB-loop, pitch control, thumbnail previews, image positioning... Want to make it full featured for how I use it.
- **yazi** — My config with Gruvbox Material color theme and various other changes. Plugins are managed through yazi's own package manager (`ya pkg`), not by hand.

## Theme

[***Gruvbox Material***](https://github.com/sainnhe/gruvbox-material) - The best color palette ever created (I say, having previously saying the exact same thing about [Dracula](https://github.com/dracula/dracula-theme) and [Cattpuccin Mocha](https://github.com/catppuccin/catppuccin))
