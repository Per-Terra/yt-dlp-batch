# yt-dlp-batch

yt-dlp-batch is a very simple batch downloader for online videos.

日本語版は [README.ja.md](README.ja.md) にあります。

## Download

Right click on the link below and select "Save link as..."

**[yt-dlp-batch.bat](https://raw.githubusercontent.com/Per-Terra/yt-dlp-batch/main/yt-dlp-batch.bat)**  
**[yt-dlp-batch-audio.bat](https://raw.githubusercontent.com/Per-Terra/yt-dlp-batch/main/examples/yt-dlp-batch-audio.bat)** for audio only

## How to use

### Instalattion

Place the following packages in the same directory as the batch file:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) (required)
- [ffmpeg](https://www.ffmpeg.org/) (optional/recomended)
  - to get the audio only version of the video
- [aria2c](https://aria2.github.io/) (optional/recomended)
  - to get download faster

Note: If you have added these packeages to your PATH, you don't need to place them in the same directory.

### Configuration

- You can edit `yt-dlp-batch.bat` directly to change the default configuration
- [yt-dlp-batch-auido.bat](examples/yt-dlp-batch-audio.bat) is an example of the audio only version

### Use browser cookies

- In default settings, cookies on the Google Chrome will be used.
  - If you want to use Firefox, you need to edit `yt-dlp-batch.bat` and change the `--cookies-from-browser chrome` option to `--cookies-from-browser firefox`
- If `youtube.com_cookies.txt` stored in the same directory as `yt-dlp-batch.bat`, it will be used
  - You can change fileneme by editing `yt-dlp-batch.bat`
  - You can get the cookies from the browser by using extentions
    - Example: [Get cookies.txt](https://chrome.google.com/webstore/detail/get-cookiestxt/bgaddhkoddajcdgocldbbfleckgcbcid) for Chromium browsers

## LICENSE

This software is licensed under the [MIT license](https://opensource.org/licenses/MIT).

See also [LICENSE](LICENSE).
