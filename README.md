# YouTube To Mp3 - v2

This is a Flutter-based application that allows you to convert YouTube and YouTube Music videos to MP3 files and add metadata tags to them, using the powerful [ffmpeg](https://ffmpeg.org/) library. With this app, you can easily extract the audio from any YouTube or YouTube Music video and save it as an MP3 file, ready to be played right on your device!

>Notice: This is the new version of the application (Here you can find: [Version 1](https://github.com/Hazaaa/Youtube-To-Mp3)), that is now developed in Flutter and it will be using it's cross-platform power to run this app on all devices (currently it's only working on Windows).

![YouTube-To-Mp3-GitHub-Cover](https://user-images.githubusercontent.com/36667491/224852054-1fbc9e7b-d128-4473-ad35-dfdc35e0a200.gif)

## Disclaimer

This app is intended for personal learning use only and should not be used to download copyrighted content from YouTube or any other platform without the owner's permission. I, as a developer of this app, am not responsible for any misuse or legal issues that may arise from using this app. So Google please don't sue me 😅

## Features

- Convert YouTube and YouTube Music videos to Mp3 file with 192k bitrate (selecting file type and it's bitrate will be added in the future)!
- Adding ID3v2 metadata tags to converted files: Title, Artist, Album, Album Cover and Genre (more metadata will be added in the future)!
- High-quality audio conversion using [ffmpeg](https://ffmpeg.org/)!
- Clean and intuitive user interface!

## Requirements

- Windows operating system (Windows 7+).
- You may need to install Visual C++ Redistributable ([x86](https://aka.ms/vs/17/release/vc_redist.x86.exe) - [x64](https://aka.ms/vs/17/release/vc_redist.x64.exe)).
- App is using [ffmpeg](https://ffmpeg.org/) and if you don't have it installed on your machine you can download it by yourself or you can download it through this app.

## Installation

To install the application, download the latest release from the [releases page](https://github.com/Hazaaa/YouTube-To-Mp3-v2/releases).

- Create folder where you want to install the application.
- Extract the contents of the package to the folder you've created.
- Run the YouTubeToMp3.exe file to start the application.
- Additionally you can create shortcut on the desktop for that YouTubeToMp3.exe file so you have easy access on your desktop or wherever you want.

## How to use
- Take any YouTube or YouTube music video url and paste it application. After video is processed you will see basic information about the video.
- Now you can select where you want to save your converted Mp3 file (by default is in 'Documents' folder).
- After that you can add tags that you want to apply to your converted Mp3 file.
- Click convert and wait for convertion to finish.
- And that's it! Your Mp3 file will be in folder you've selected!

## Screenshots
![YouTube-To-Mp3-Starting-Screen](https://user-images.githubusercontent.com/36667491/224854361-d0374c90-4b82-4d84-9484-3934fc199d5c.png)

![YouTube-To-Mp3-Loaded-data](https://user-images.githubusercontent.com/36667491/224854409-89983c8a-3d82-4167-b44a-552f607029e3.png)

![YouTube-To-Mp3-Adding-Tags](https://user-images.githubusercontent.com/36667491/224854804-1a2c951e-c852-4643-afac-0d3534955a27.png)

## Contributing

If you would like to contribute to this project, feel free to open an issue or submit a pull request. You can find future features below if you want to help. Contributions are always welcome and appreciated!

## Coming soon
- [ ]  Add support for different platforms (Linux, Mac OS, Web, Android, iOS).
- [ ]  Add option to pick different sound file types.
- [ ]  Add option to pick different bitrates.
- [ ]  Add option to save video.
- [ ]  Add option to convert multiple videos or whole YouTube playlists (will require better interface design).
- [ ]  Add more metadata options.
- [ ]  Improve UI/UX.
- [ ]  Improve code.
- [ ]  Improve error handling (add logs).

## License

This application is released under the MIT License.
