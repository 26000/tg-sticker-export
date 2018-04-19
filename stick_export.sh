#!/bin/bash

# stick_export.sh by 26000 (https://github.com/26000/tg-sticker-export)
# License: BSD 3-clause

## Usage: ./stick_export.sh <stickerpack name or URL>
#
# Will download all stickers in the stickerset to a <stickername> dir, which
# contains two subdirs: webp and png, for respective file formats.
#
# Be sure to insert your bot token (below) before use.
#
# In order to get the stickerpack URL, do the following:
# (using TDesktop)
# 1. Find the stickerset in your stickers panel
# 2. Click on its name
# 3. Click 'Share stickers'
# 4. Paste the link as an argument to this script

## Dependencies
# - bash or something compatible
# - curl, wget (for http requests)
# - ffmpeg (for convertation to png)
# - jq (!) (for json parsing)
# - sed (for parsing parsed json)

### SETTINGS ###
# You need to get a bot token. Go talk to https://t.me/BotFather, write
# '/newbot' and follow its instructions. Eventually you get a token.
# You can just wait for something scary to appear in the chat and that is a token.
TOKEN=
### END OF SETTINGS ###

## TODO
# - a nice README
# - settings to decide wether to convert stickers to png or leave in webp
# - a token checker which will tell the user if something's wrong with it
# - cli flags like help or to specify the output directory
# - make it quiet? and use a flag for verbosity
# - [your feature here]

# Don't edit anything below this line if you don't know what you are doing!


red=$(tput setaf 1)
yel=$(tput setaf 11)
nat=$(tput sgr0)

echo_yel() {
        echo "$yel$@$nat"
}

if [[ -z $1 ]]
then
        echo "Please specify the stickerset name."
        exit
fi

s="${1##*/}"

mkdir -p $s/webp
mkdir -p $s/png
for i in `curl https://api.telegram.org/bot$TOKEN/getStickerset -F "name=$s" | jq '(.result.stickers)[].file_id'`; do
        echo_yel "Getting filepath for $i..."
        filepath=$(echo "https://api.telegram.org/file/bot$TOKEN/`curl "https://api.telegram.org/bot$TOKEN/getFile" -F file_id="$i" | jq .result.file_path`" | sed -e 's/"//g')
        filename="${filepath##*/}"
        echo_yel "Downloading $filepath..."
        wget $filepath
        ffmpeg -i $filename $filename.png
        mv $filename $s/webp/
        mv $filename.png $s/png/
        sleep 1
done

echo_yel "Sticker pack saved at $s."
