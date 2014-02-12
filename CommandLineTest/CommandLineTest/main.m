//
//  main.m
//  CommandLineTest
//
//  Created by William on 2/8/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int answer = 0;
        int guess = 0;
        int turnCount = 0;
        
        answer = arc4random() % 100 + 1;
        
        NSLog(@"Enter a number between 1 and 100");
        while (guess != answer) {
            scanf("%i", &guess);
            turnCount++;
            
            if (guess > answer){
                NSLog(@"Too high! Guess a lower number.");
            } else if (guess < answer){
                NSLog(@"Too low! Guess a higher number.");
            } else {
                NSLog(@"Congratulations, you win!");
                NSLog(@"The answer was: %i", answer);
                NSLog(@"It only took you %i tries!", turnCount);
            }
        }
        
    }
    return 0;
}

