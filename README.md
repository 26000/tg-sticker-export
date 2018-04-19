## Telegram stickers export script
Download all your stickers into a local directory.

![Amada Kokoro writing Japanese syllables](https://i.imgur.com/MoSgmOZ.png)

(from [Amada Kokoro stickerpack](https://t.me/addstickers/Amada_Kokoro))


### Usage
```
./stick_export.sh <stickerpack name or URL>
```

Will download all stickers in the stickerset to a `<stickername>` dir, which
contains two subdirs: webp and png, for respective file formats.

Be sure to insert your bot token (see below) before use.

In order to get the stickerpack URL, do the following (using TDesktop):
 1. Find the stickerset in your stickers panel
 2. Click on its name
 3. Click 'Share stickers'
 4. Paste the link as an argument to this script

### Dependencies
 - [bash](https://www.gnu.org/software/bash/) or something compatible ([zsh](https://www.zsh.org/))
 - [curl](https://curl.haxx.se/), [wget](https://www.gnu.org/software/wget/) (for http requests)
 - [ffmpeg](https://ffmpeg.org/) (for convertation to png)
 - [jq](https://stedolan.github.io/jq/) (!) (for json parsing)
 - [sed](https://www.gnu.org/software/sed/) (for parsing parsed json)

### Setup
You need to get a bot token. Go talk to https://t.me/BotFather, write
`/newbot` and follow its instructions. Eventually you get a token.
You can just wait for something scary to appear in the chat and that is a token.

### TODO
 - [x] a nice README
 - [ ] settings to decide wether to convert stickers to png or leave in webp
 - [ ] a token checker which will tell the user if something's wrong with it
 - [ ] cli flags like help or to specify the output directory
 - [ ] make it quiet? and use a flag for verbosity
 - [your feature here]

Pull requests are welcome!

### Authors
[26000](https://github.com/26000)

### Inspiration
I'm moving to [Matrix](https://matrix.org) from Telegram. It's better, *much* better. Thanks to Matrix and Riot developers! And to my girlfriend, my first contact in Matrix.
