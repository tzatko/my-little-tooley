# my-little-tooley
A collection of small scripts that I use regularly. It ain't much, but it's honest code.

# Scripts Overview

## Ba-Dum-Tss.sh
A script to play the "[ba-dum-tss](https://www.youtube.com/watch?v=6zXDo4dL7SU)" sound effect, typically used after a joke.

## hj
Converts all HEIC files to JPEG files in the current directory.

## iPhoneify.sh
Converts media files to a format compatible with iPhones. Useful for downloading cartoons with tools like [yt-dlc](https://github.com/blackjack4494/yt-dlc), then converting and airdropping them to your iPhone. Ideal for offline viewing during flights, especially takeoff and landing, to keep children distracted from pressure-change related pain.

## nfn
Renames files by replacing problematic characters with underscores. Provides an option to partially reverse the process.

## sleep\_after\_backup.sh
Puts the system to sleep after completing a backup process.

## tl2
Traverses a directory, calculates file size and SHA256 hash, and writes the information to an Excel file. Named "tl" possibly for "tree list."

## v2mp3
Extracts audio from video files and saves it as MP3.

## vl
Outputs the total duration time of all video files in a directory (recursively).

## webm2mp4
Converts WEBM video files to MP4 format.

## wma2mp3
Converts WMA audio files to MP3 format.

## pgw
Automatically detects the default gateway (IPv4 or IPv6) and pings it.
It uses the 'gping' tool if available, otherwise falls back to the standard 'ping' command.

### Usage

- **IPv4 Gateway**: Run the script as `pgw` to ping the default IPv4 gateway.
- **IPv6 Gateway**: Create a symlink named `pgw6` and run it to ping the default IPv6 gateway.

#### Create the Symlink for IPv6

```bash
ln -s pgw pgw6

