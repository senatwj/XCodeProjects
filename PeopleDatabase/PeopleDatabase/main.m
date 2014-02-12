//
//  main.m
//  PeopleDatabase
//
//  Created by William on 2/8/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        /*int x = 10;
        NSString *myString = [NSString stringWithFormat:@"The variable x stores the number %i", x];
        NSLog(@"%@", myString);
        
        NSLog(@"Please enter a word:");
        
        char cstring[40];
        
        scanf("%s", cstring);
        
        NSString *inputString = [NSString stringWithCString:cstring encoding:1];
        
        NSLog(@"You entered the word '%@' and it is %li characters long.", inputString, [inputString length]);*/
        
        char response;
        NSMutableArray *people = [[NSMutableArray alloc] init];
        
        do {
            Person *newPerson = [[Person alloc] init];
            
            [newPerson enterInfo];
            [people addObject:newPerson];
            [newPerson printInfo];
            
            NSLog(@"Do you want to enter another person? (y/n)");
            scanf("\n%c", &response);
        } while (response == 'y');
        
        NSLog(@"Number of people in the database: %li", [people count]);
        for (Person *onePerson in people){
            [onePerson printInfo];
        }
        
        
    }
    return 0;
}

