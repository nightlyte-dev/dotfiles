# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal Linux dotfiles for `nightlyte` (Arch Linux, KDE Plasma 6, Hyprland), meant to be paired with [f0rge](https://github.com/nightlyte-dev/f0rge.git), an in-development external system-crafting tool. f0rge includes a script that clones this repo and runs `stow` over all the stowable folders — so the folder list below and the stow package names are load-bearing for that integration, not just documentation. There is no build, lint, or test tooling here — this is a config/scripts repo, not an application. Changes are verified by using the relevant app (nvim, mpv, yazi, etc.), not by running a test suite.

Treat most files here as a moving target, not a stable spec: the owner iterates on configs constantly (see README's "ephemeral and transitory" framing), so don't assume a file's current state reflects settled intent — check the README/CLAUDE.md status tags below and recent commits before assuming a package is final.

## Layout convention

Each top-level directory is a self-contained config bundle for one application or subsystem, generally named after that tool. The repo serves two different purposes depending on the directory:

- **GNU Stow packages** — each contains a `.config/` (or other home-relative) subtree that mirrors the layout expected under `$HOME`, meant to be stowed (`stow <dir>` from the repo root) to symlink it into place. E.g. `mpv/.config/mpv/mpv.conf` stows to `~/.config/mpv/mpv.conf`. When editing these, preserve the path relative to the bundle's `.config`/home root exactly — Stow's symlinking depends on that structure matching real home paths. Stow will refuse to link over a real (non-symlink) file/dir that already exists at the target path — the README's documented fix is to move it aside first (e.g. `mv ~/.config/mpv ~/.config/mpv.bak`), not to force/overwrite it. Per the README, these carry a status:
  - Actively used: `fish/`, `ghostty/`, `mpv/`, `nvim/`, `starship/`, `yazi/`
  - In development: `hyprland/`
  - Not actively used/discontinued: `zshrc/` (kept around, but `fish/` is the current shell)
- **General config/customization references** — everything else is reference material or system-level (non-home) config, not stowed:
  - `browser-config/` — Firefox/LibreWolf/Chrome themes, extension settings exports, and an `extension-list.md` documenting which browser extensions + `about:config` flags to set up manually.
  - `keyd/` — system-level `keyd` remap configs deployed to `/etc/keyd/`, not `$HOME`. `default.conf` is the keyboard (Capslock → Meta layer, plus optional personal remaps for an HHKB Pro Hybrid Type-S); `razernagav2pro.conf` maps the Razer Naga V2 Pro's 12 buttons (currently KDE Plasma shortcuts + KZones).
  - `kde-plasma-6/` — exported KDE shortcut bindings.
  - `kwin/kzones/` — KZones tiling-layout JSON exports for KWin.
  - `obsidian/` — an Obsidian vault theme (Gruvbox-Material) to drop into `{VAULT_FOLDER}/.obsidian/themes/`.
  - `scripts/` — standalone utility scripts (e.g. `hidetaskbar.ahk`, an AutoHotkey v2 script for Windows).
  - `powershell/` — PowerShell profile + oh-my-posh themes, for the Windows side of things.

## Notable subsystems

- **nvim** (`nvim/.config/nvim/`): a [LazyVim](https://lazyvim.github.io) starter. Custom config lives under `lua/config/` (`autocmds.lua`, `keymaps.lua`, `options.lua`, `lazy.lua`) and plugin specs/overrides under `lua/plugins/`. `lazy-lock.json` is gitignored, so plugin versions aren't pinned in this repo.
- **mpv** (`mpv/.config/mpv/`): heavily customized with many third-party Lua scripts in `scripts/` (uosc, thumbfast, playlist manager, crop/encode, AB-loop, pitch control, image positioning, etc.), plus `script-opts/` and `script-modules/` for their settings. `mpvClipboard.log` is gitignored.
- **yazi** (`yazi/.config/yazi/`): file manager config. Plugins and flavors are declared as pinned deps in `package.toml` (`plugin.deps` / `flavor.deps`, each with `use`/`rev`/`hash`) and vendored under `plugins/` and `flavors/`. When updating a plugin/flavor, update both the vendored files and its `package.toml` entry (rev + hash) together — this is normally done via yazi's own package manager (`ya pkg`), not by hand-editing.
- **fish** (`fish/.config/fish/`): current shell (successor to `zshrc/`). `conf.d/` and `functions/` hold drop-in config and custom functions; `fish_variables` is gitignored (machine-local universal variables, not meant to be shared).
- **ghostty** (`ghostty/.config/ghostty/`): terminal config, split into `config.ghostty` and `keybinds.ghostty`.
- **Gruvbox Material** is the recurring color scheme across yazi, obsidian, and browser themes, with a palette reference at `browser-config/gruvbox-material-dark-medium-palette.txt` — prefer it as the default when adding new themed configs unless told otherwise.

## Gitignored / not tracked

`scripts/test.sh`, `scripts/testsource.sh`, `nvim/.config/nvim/lazy-lock.json`, `mpv/.config/mpv/mpvClipboard.log`, and `fish/.config/fish/fish_variables` are gitignored — don't expect these to exist or commit changes to them.
