//
//  QuoteQuizViewController.h
//  QuoteQuiz
//
//  Created by William on 2/13/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Quiz;

@interface QuoteQuizViewController : UIViewController

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) Quiz *quiz;

@end
