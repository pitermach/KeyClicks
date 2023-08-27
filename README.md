# KeyClicks

KeyClicks is a Spoon for the Mac OS automation utility Hammerspoon. As its name suggests, it provides soft clicks while you type in any text field. The inspiration for writing this spoon came from the [Typing Settings NVDA addon.](https://github.com/abdallah-hader/typing_settings) Typing Clicks provides the following features:

- Plays different sounds for lower and uppercase letters, punctuation and numbers, spaces, enter and deleting text.
- The sounds play only while focus is in a text field, so you won’t get random clicks when navigating other parts of the system
- Should work in any language
- Adjustable volume

One thing I'm not planning to add to KeyClicks is a way to play other random sounds to simulate a real keyboard. There are many apps specifically designed to do this, including Klack, MKS and Loud Typer, so if that's what you're looking for you'll be much better served with one of those apps. In contrast to those apps however, KeyClicks activates only when actually entering text and has very quiet sounds that can not only provide a pleasing background, but also help you catch typos like accidentally ENtering one too many capital letters thanks to having different sounds for lower and uppercase letters.

### Installation

First, download and install Hammerspoon. You can do so either [from their Github](https://github.com/Hammerspoon/hammerspoon/releases/latest), or if you have it installed, through homebrew simply by running "brew install Hammerspoon" in the terminal. Once you have it installed, run it, and follow the prompts to grant accessibility permissions (I also choose to hide the app from the dock here so it stays out of your command-tab switcher)


Once Hammerspoon is installed and configured, you can download KeyClicks. Either clone it using Git from the terminal, or simply download the code as zip by expanding the “code” summary on the page and clicking the download zip link. Then, navigate into the folder where you cloned/extracted this repository with Finder or another file manager, and open “KeyClicks.spoon" which should cause Hammerspoon to install it into the right place. Finally, from the Hammerspoon menu extra select the open configuration option which should open your default text editor with your init.lua file. To make KeyClicks work and do its thing, simply add the following 2 lines:
```lua
hs.loadSpoon("KeyClicks")
spoon.KeyClicks:start()
```

Save the file, return to the Hammerspoon menu extra but this time click the reload configuration option for your new changes to take effect. And this should be all there is to it!

If you’d like to adjust the volume of the clicks, in your init.lua file below the start command you can add the following line:

`spoon.KeyClicks.setVolume(0.5)` where the 0.5 can be any number between 1 (full volume) and 0 (muted)

KeyClicks uses the [luautf8 module](https://github.com/starwing/luautf8) to support characters in languages other than English. For convenience, I have included a compiled version of this library as a universal binary so you don’t need to do anything, but if you’d rather run it from source you can remove lua-utf8.so from the spoon’s directory, and then install luautf8 from luarocks (Hammerspoon should find it automatically.)

Enjoy your enhanced typing experience!