# HNKWordLookup

http://cocoapods.org/pods/HNKWordLookup
=======================================

[![CocoaPods](https://img.shields.io/cocoapods/v/HNKWordLookup.svg)]()
[![CocoaPods](https://img.shields.io/cocoapods/l/HNKWordLookup.svg)](https://github.com/hkellaway/HNKWordLookup/blob/feature/readme/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/p/HNKWordLookup.svg)]()
[![Build Status](https://travis-ci.org/hkellaway/HNKWordLookup.svg?branch=master)](https://travis-ci.org/hkellaway/HNKWordLookup)

HNKWordLookup is a Cocoapod that helps with standard English-language dictionary queries, such as definitions, pronunciations, random words, and Word of the Day.

## How To Get Started

- [Download HNKWordLookup](https://github.com/hkellaway/HNKWordLookup/archive/master.zip) and try out the included iOS example app
- Check out the [documentation](http://cocoadocs.org/docsets/HNKWordLookup/) for a more comprehensive look at the classes available in HNKWordLookup

## Communication

- If you **found a bug**, _and can provide steps to reliably reproduce it_, [open an issue](https://github.com/hkellaway/HNKWordLookup/issues/new).
- If you **have a feature request**, [open an issue](https://github.com/hkellaway/HNKWordLookup/issues/new).
- If you **want to contribute**, [submit a pull request](https://github.com/hkellaway/HNKWordLookup/pulls).

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like HNKWordLookup in your projects. Cocoapods is the preferred way to incorporate HNKWordLookup in your project; if you are unfamiliar with how to install Cocoapods or how create a Podfile, there are many tutorials online.

#### Podfile

```ruby
platform :ios, '7.0'
pod "HNKWordLookup", "~> 1.0"
```

## API Key

HNKWordLookup uses the [Wordnik](http://developer.wordnik.com/docs.html) API to lookup information. You will need a Wornik API key in order to use HNKWordLookup.

* Create a [Wordnik](https://www.wordnik.com/signup) account
* Once activated, find your API key on your [Settings](https://www.wordnik.com/users/edit) page

## Architecture

### Models

- `HNKLookup`
- `HNKWordDefinition`
- `HNKWordPronunciation`
- `HNKWordOfTheDay`
- `HNKRandomWord`
- `HNKHttpSessionManager`

### Utility

- `NSDate+HNKAdditions`

## Usage

### Setup

Requests cannot be made without first supplying `HNKWordLookup` with your Wordnik API Key (see [Getting Started](#getting-started)). Once your API key is obtained, you can set `HNKWordLookup` for use by calling `sharedInstanceWithAPIKey` (typically within the `AppDelegate`):

```objective-c
[HNKWordLookup sharedInstanceWithAPIKey:@"YOUR_API_KEY"];
```

You should replace `YOUR_API_KEY` with your Wordnik API key.

Note: `HNKWordLookup` will not work without first being setup with an API key.

### Lookups

`HNKLookup` is responsible for handling any lookups of information. One [Setup](#setup) is complete, lookup requests can be made to `[HNKLookup sharedInstance]`.

#### Looking up `definitions`

```objective-c
[[HNKWordLookup sharedInstance] definitionsForWord:@"center" completion:^(NSArray *definitions, NSError *error) {
    if (error) {
        NSLog(@"ERROR: %@", error);
    } else {
        for (HNKWordDefinition *definition in definitions) {
	        NSLog(@"%@", definition);
		}
    }
}];
```

#### Looking up `definitions` with specific `partsOfSpeech`

```objective-c
[[HNKWordLookup sharedInstance] definitionsForWord:@"center" 
                                 withPartsOfSpeech:HNKWordDefinitionPartOfSpeechNoun | HNKWordDefinitionPartOfSpeechVerbTransitive
                                        completion:^(NSArray *definitions, NSError *error) {
    if (error) {
        NSLog(@"ERROR: %@", error);
    } else {
        for (HNKWordDefinition *definition in definitions) {
	        NSLog(@"%@", definition);
		}
    }
}];
```

Note: The `partsOfSpeech` argument can take any number of `HNKWordDefinitionPartOfSpeech` types separated by a `|` symbol.

#### Looking up `pronunciations`

```objective-c
[[HNKWordLookup sharedInstance] pronunciationsForWord:@"orange" withCompletion:^(NSArray *pronunciations, NSError *error) {
    if (error) {
        NSLog(@"ERROR: %@", error);
    } else {
        for (HNKWordPronunciation *pronunciation in pronunciations) {
	        NSLog(@"%@", pronunciation);
		}
    }
}];
```

#### Looking up a `randomWord`

```objective-c
[[HNKWordLookup sharedInstance] randomWordWithCompletion:^(NSString *randomWord, NSError *error) {
    if (error) {
        NSLog(@"ERROR: %@", error);
    } else {
	    NSLog(@"%@", randomWord);
    }
}];
```

### Looking up the `wordOfTheDay`

```objective-c
[[HNKWordLookup sharedInstance] wordOfTheDayWithCompletion:^(HNKWordOfTheDay *wordOfTheDay, NSError *error) {
    if (error) {
        NSLog(@"ERROR: %@", error);
    } else {
		NSLog(@"%@", wordOfTheDay);
    }
}];
```

### Looking up the `wordOfTheDay` for a specific `date`

```objective-c
[[HNKWordLookup sharedInstance] wordOfTheDayForDate:(NSDate *)date completion:^(HNKWordOfTheDay *wordOfTheDay, NSError *error) {
    if (error) {
        NSLog(@"ERROR: %@", error);
    } else {
		NSLog(@"%@", wordOfTheDay);
    }
}];
```

## Credits

HNKWordLookup was created by [Harlan Kellaway](https://github.com/hkellaway/).

## License

HNKWordLookup is available under the MIT license. See the [LICENSE](https://github.com/hkellaway/HNKWordLookup/blob/feature/readme/LICENSE) file for more info.