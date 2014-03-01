//
//  RecipeDetailViewController.h
//  RecipeBook
//
//  Created by William on 2/28/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end
