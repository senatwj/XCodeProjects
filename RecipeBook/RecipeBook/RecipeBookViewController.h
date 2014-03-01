//
//  RecipeBookViewController.h
//  RecipeBook
//
//  Created by William on 2/28/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeBookViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end
