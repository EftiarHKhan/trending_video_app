# Trending video application


The Trending Video Application is a mobile platform designed to deliver the latest and most popular videos effortlessly. With a pixel-perfect user interface, intuitive navigation, and seamless pagination, users can explore a curated selection of trending videos in real-time. The app employs an efficient video player library, enabling smooth playback without additional API calls for video details. 

## Overview

This Flutter project utilizes the GetX state management library to build a mobile application for watching trending videos. The application consists of two main screens: the Home Page and the Details Video Page.

## Screnshots

![home page](https://github.com/EftiarHKhan/trending_video_app/assets/105238792/e66a1161-49b0-4699-9d3c-5da2a795b415)

![Video detail page](https://github.com/EftiarHKhan/trending_video_app/assets/105238792/88ee67b8-2c3a-4cd7-86b9-892e45c02bd5)


## Features

### Home Page

- Display a list of trending videos.
- Each video item on the list is clickable, redirecting users to the Details Video Page.

### Details Video Page

- Play the selected video using the Chewie video player.
- Display video details, including a description.

## Project Structure

- **lib/**
  - **pages/**
    - **home_page.dart**: Implementation of the Home Page.
    - **details_video_page.dart**: Implementation of the Details Video Page.
  - **widgets/**
    - **video_player_widget.dart**: Custom widget for displaying videos with Chewie.

## Dependencies

- `get: ^4.1.4`: GetX state management library.
- `chewie: ^1.4.0`: Video player widget for Flutter.
- `video_player: ^2.5.0`: Flutter plugin for video playback.

## Getting Started

1. Clone the repository.
2. Run `flutter pub get` to install dependencies.
3. Run the app on your preferred emulator or physical device using `flutter run`.

## Usage

- Explore trending videos on the Home Page.
- Click on a video to view details and play it on the Details Video Page.

## Future Enhancements

- Enhance the user interface for a more polished look.


## Contributors

- Md Eftiar Haider Khan


## Acknowledgments

- Other third-party libraries are used.
