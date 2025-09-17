# post - AssigneMent

## Overview
A Flutter mobile application that fetches posts from JSONPlaceholder API
 and displays them in a list. Users can view post details, mark posts as read, and each post has a timer that pauses/resumes automatically. Data is persisted locally to maintain state across app restarts.

## Getting Started

Features

## Splash Screen

Displays the title "Assignment".

A "Get Started" button at the bottom (90% screen width, blue color).

Navigates to the Post List Screen when tapped.

## Post List Screen

Displays posts loaded from local storage first, then updates from the API.

Each post row includes:

Background: light yellow for unread, white for read.

A timer icon showing a random countdown (10, 20, or 25 seconds).

## Tap on a post:

Marks it as read.

Opens the Detail Screen showing full post body.

## Detail Screen

Displays the full post body fetched from API.

Timer Functionality

Each post timer starts when the post is visible on the screen.

Pauses if the post scrolls out of view or when navigating to the detail screen.

Resumes when the post becomes visible again.

## Local Storage

Stores posts, read/unread status, and timer durations using SharedPreferences.

Ensures data persists across app restarts.


## How the App Works

## Splash Screen

App starts with a splash screen showing the title and  "Get Started" button.

User taps Get Started → navigates to the Post List Screen.

## Post List Screen

Loads posts from local storage first for fast display.

Fetches fresh posts from API in the background.

Displays posts with timers and read/unread status.

## Detail Screen

Displays full post body when a post is tapped.

Timers

Each post timer starts when the post is visible.

Pauses/resumes automatically based on scroll or navigation.

Data Persistence

Read/unread status and timer durations are saved to local storage.

Posts retain their state across app restarts.

## Running the App
1.Clone the repository:

```bash
git clone https://github.com/chandan-77/assignement_task.git