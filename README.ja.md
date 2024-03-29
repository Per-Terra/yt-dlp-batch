# yt-dlp-batch

yt-dlp-batch は、オンライン動画を一括ダウンロードするためのシンプルなバッチダウンロードツールです。

## ダウンロード

下記のリンクを右クリックして、「名前を付けて保存」を選択してください。

**[yt-dlp-batch.bat](https://raw.githubusercontent.com/Per-Terra/yt-dlp-batch/main/yt-dlp-batch.bat)**  
**[yt-dlp-batch-audio.bat](https://raw.githubusercontent.com/Per-Terra/yt-dlp-batch/main/examples/yt-dlp-batch-audio.bat)** (音声のみ)

## 使い方

### インストール

次のパッケージを同じディレクトリに配置してください:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) (必須)
- [ffmpeg](https://www.ffmpeg.org/) (オプション/推奨)
  - 動画から音声を抽出する場合
- [aria2c](https://aria2.github.io/) (オプション/推奨)
  - ダウンロードを高速化する場合

注: PATH に追加している場合、これらのパッケージを同じディレクトリに配置する必要はありません。

### 設定

- `yt-dlp-batch.bat` を直接編集することで、デフォルトの設定を変更できます
- [yt-dlp-batch-audio.bat](examples/yt-dlp-batch-audio.bat) は、音声のみをダウンロードするように設定した例です

### ブラウザのクッキーを使用する

- デフォルトでは、Google Chrome のクッキーを使用します
  - Firefox の場合は、 `--cookies-from-browser chrome` オプションを `--cookies-from-browser firefox` に変更してください
- `youtube.com_cookies.txt` が同じディレクトリに存在する場合、それが使用されます
  - ファイル名を変更することもできます
  - クッキーをブラウザから取得するには、拡張機能を使用してください
    - 例: Chromium 系のブラウザでは [Get cookies.txt](https://chrome.google.com/webstore/detail/get-cookiestxt/bgaddhkoddajcdgocldbbfleckgcbcid) が利用できます

## LICENSE

このソフトウェアは [MIT License](https://opensource.org/licenses/MIT) の下で配布されています。

詳しくは [LICENSE](LICENSE) を参照してください。
