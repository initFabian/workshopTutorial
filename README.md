# UH iOS Workshop 

## Prerequisites

Make sure you have installed all of the following prerequisites on your development machine:

- Xcode - [Download & Install Xcode 7](https://developer.apple.com/xcode/download/).
- Git - [Download & Install Git](https://git-scm.com/downloads)
- CocoaPods - [CocoaPods](https://cocoapods.org/) is the dependency manager for Swift and Objective-C Cocoa projects. 

To install CocoaPods, you must have `Homebrew` installed on your Mac. Open the Terminal and run the following command: 

```bash
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Once `Homebrew` has installed, you will need to install CocoaPods with the following command:

```bash
$ sudo gem install cocoapods
```

### Cloning The GitHub Repository
The recommended way to get workshopTutorial is to use git to directly clone the workshopTutorial repository:

```bash
$ git clone https://github.com/fbuentello/workshopTutorial.git
```

## Quick Install
Once you've cloned workshopTutorial and installed all the prerequisites, you're just a few steps away from getting starting.

The first thing you should do is install the Pod dependencies. The repo comes with a `Podfile` that contains the list of dependencies you need to start your application. 

To install the Pod dependencies, open up a Terminal in the application folder run this in the command-line:

```bash
$ pod install
```
This may take a minute, but once complete, you should have a few new files in your directory. Be sure to close out any Xcode sessions as it should say on the terminal:

```bash
[!] Please close any current Xcode sessions and use `workShopTutorial.xcworkspace` for this project from now on.
```
