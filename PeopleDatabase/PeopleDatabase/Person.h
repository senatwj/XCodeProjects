//
//  Person.h
//  PeopleDatabase
//
//  Created by William on 2/8/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject{
    NSString *firstName;
    NSString *lastName;
    int age;
}
- (void)enterInfo;
- (void)printInfo;

@end
