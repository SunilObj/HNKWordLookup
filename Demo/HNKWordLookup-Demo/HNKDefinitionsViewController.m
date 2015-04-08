//
//  HNKDefinitionsViewController.m
//  HNKWordLookup-Demo
//
//  Created by Harlan Kellaway on 4/5/15.
//  Copyright (c) 2015 Harlan Kellaway. All rights reserved.
//

#import "HNKDefinitionsViewController.h"

static NSString *const kHNKDemoPlaceholderText = @"Loading...";

@interface HNKDefinitionsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;

@end

@implementation HNKDefinitionsViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  self.wordLabel.text =
      self.word ? self.word : NSLocalizedString(kHNKDemoPlaceholderText, @"");
}

#pragma mark - Setters

- (void)setWord:(NSString *)word
{
  _word = word;

  self.wordLabel.text = word;
}

@end
