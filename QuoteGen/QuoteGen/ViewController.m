//
//  ViewController.m
//  QuoteGen
//
//  Created by William on 2/11/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.myQuotes = @[
                      @"Live and let live.",
                      @"Don't cry over spilt milk.",
                      @"Always look on the bright side of life.",
                      @"Nobody's perfect.",
                      @"Can't see the woods for the trees.",
                      @"Better to have loved and lost then not loved at all.",
                      @"The early bird catches the worm.",
                      @"As slow as a wet week."];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)quoteButtonTapped:(id)sender{
    if (self.quoteOpt.selectedSegmentIndex == 2){
        int array_tot = [self.myQuotes count];
        /*int index = (arc4random() % array_tot);
        NSString *my_quote = self.myQuotes[index];*/
        NSString *all_my_quotes = @"";
        NSString *my_quote = nil;
        for (int x = 0; x < array_tot; x++){
            my_quote = self.myQuotes[x];
            all_my_quotes = [NSString stringWithFormat:@"%@\n%@\n", all_my_quotes, my_quote];
        }
        self.quoteText.text = [NSString stringWithFormat:@"%@", all_my_quotes];
    } else {
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1){
            selectedCategory = @"modern";
        }
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        
        int array_tot = [filteredArray count];
        if (array_tot > 0){
            int index = (arc4random() % array_tot);
            NSString *quote = filteredArray[index][@"quote"];
            NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
            if (![source length] == 0){
                quote = [NSString stringWithFormat:@"%@\n\n(%@)", quote, source];
            }
            //self.quoteText.text = [NSString stringWithFormat:@"%@ Movie Quote:\n\n%@", selectedCategory.capitalizedString, quote];
            if ([selectedCategory isEqualToString:@"classic"]){
                quote = [NSString stringWithFormat:@"From Classic Movie:\n\n%@", quote];
            } else {
                quote = [NSString stringWithFormat:@"Movie Quote:\n\n%@", quote];
            }
            if ([source hasPrefix:@"Harry"]){
                quote = [NSString stringWithFormat:@"HARRY ROCKS!!\n\n%@", quote];
            }
            self.quoteText.text = quote;
        } else {
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display."];
        }
    }
    
    /*int array_tot = [self.movieQuotes count];
    int index = (arc4random() % array_tot);
    NSString *my_quote = self.movieQuotes[index][@"quote"];
    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@", my_quote];*/
}

@end
