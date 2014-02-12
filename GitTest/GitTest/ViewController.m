//
//  ViewController.m
//  GitTest
//
//  Created by William on 2/12/14.
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
    
    NSLog(@"The application finished loading.");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushTheButton:(id)sender{
    NSLog(@"Oh, you pushed me!");
}

@end
