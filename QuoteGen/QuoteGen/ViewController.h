//
//  ViewController.h
//  QuoteGen
//
//  Created by William on 2/11/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;

@property (nonatomic, strong) IBOutlet UITextView *quoteText;

@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

- (IBAction)quoteButtonTapped:(id)sender;

@end
