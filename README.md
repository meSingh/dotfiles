# dotfiles

![dotfiles](https://cloud.githubusercontent.com/assets/499192/8982779/ab19893e-36c4-11e5-975b-86be2af72d86.png)

.files, sensible hacker defaults for OS X. If you're curious how to setup your own dotfiles, please visit [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles) and [Mike McQuaid's strap project](https://github.com/mikemcquaid/strap) to learn more.

[![License](https://img.shields.io/github/license/mesingh/dotfiles.svg?style=flat)](https://github.com/mesingh/dotfiles/blob/master/LICENSE)

## Installation

This is the installation guide to setup these dotfiles on a new OS X system.

```bash
git clone git@github.com:mesingh/dotfiles.git
cd dotfiles
./bin/start.sh # or ./bin/start.sh --debug for more debugging output
```

Restart the computer and live happily ever after.

## Sync

The guide on how to keep your dotfiles in sync and up to date with the latest changes.

```bash
cd dotfiles
git pull
source bin/update.sh
```

## Reset
This is a checklist of things to do before resetting the disk.

1. Export `Transmit.app`, `Sequel Pro.app` favorites to Dropbox.
2. Check all GIT repositories for uncommitted changes.
4. Save latest `PhpStorm.app` settings.
5. Reconsider all applications, binaries and tools in `scripts`.

## License

The dotfiles repository is licensed under [The MIT License (MIT)](LICENSE).


## Setup Instructions 

- [] Set SSH files 
- [] Install the following apps from App Store: 
    - [] Amphetamine
    - [] Spark
    - [] HP Smart for Desktop
    - [] Numbers
    - [] Keynote
    - [] Pages
    - [] iMovie
    - [] Memory Clean 2
    - [] Clean
    - [] Xcode
    - [] Safari Extensions
        - [] SimplyJSON
        - [] Night Eye
        - [] Grammarly
        - [] Pipifier
        - [] Honey
    - [] Work Related Apps (May or may note be needed)
        - [] Jira Cloud 
        - [] Trello
- [] Install the following apps from given urls: 
    - [] Querious 2 - https://www.araelium.com/support/querious/download-previous-versions
- [] Change the following settings in iTerm
    - [] iTerm2 → Preferences → Profiles → Text → Change Font to Meslo and set Size to 14
    - [] iTerm2 → Preferences → Profiles → Text
        - [] → Cursor : ✓ Vertical Bar 
        - [] → Blinking cursor : ✓ ON
    - [] iTerm → Preferences → Profiles → Keys → Load Preset… → Natural Text Editing
    - [] iTerm2 → Preferences → Profiles → General → Set Working Directory to Reuse previous session's directory



Run the following command to automated system take care of the rest: 

```

```