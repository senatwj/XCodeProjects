//
//  SimpleTableViewController.m
//  SimpleTable
//
//  Created by William on 2/26/14.
//  Copyright (c) 2014 William. All rights reserved.
//

#import "SimpleTableViewController.h"
#import "SimpleTableCell.h"

@interface SimpleTableViewController ()

@end

@implementation SimpleTableViewController

NSArray *tableData;
NSArray *thumbnails;
NSArray *prepTime;
NSMutableArray *checkmarked;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tableData = [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    thumbnails = [NSArray arrayWithObjects:@"egg_benedict.jpg", @"mushroom_risotto.jpg", @"full_breakfast.jpg", @"hamburger.jpg", @"ham_and_egg_sandwich.jpg", @"creme_brelee.jpg", @"white_chocolate_donut.jpg", @"starbucks_coffee.jpg", @"vegetable_curry.jpg", @"instant_noodle_with_egg.jpg", @"noodle_with_bbq_pork.jpg", @"japanese_noodle_with_pork.jpg", @"green_tea.jpg", @"thai_shrimp_cake.jpg", @"angry_birds_cake.jpg", @"ham_and_cheese_panini.jpg", nil];
    prepTime = [NSArray arrayWithObjects:@"30 min", @"1 hour", @"5 hours", @"20 min", @"10 min", @"30 sec", @"12 days", @"2 hours", @"25 min", @"10 min", @"5 days", @"2 min", @"2 years", @"1 min", @"25 sec", @"45 min", nil];
    NSNumber *defaultChecked = [NSNumber numberWithInt:0];
    checkmarked = [NSMutableArray arrayWithObjects:defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, defaultChecked, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [tableData count];
}

- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSNumber *isChecked = [checkmarked objectAtIndex:indexPath.row];
    
    if ([isChecked intValue] == 0){
        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
        
    cell.nameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[thumbnails objectAtIndex:indexPath.row]];
    cell.prepTimeLabel.text = [prepTime objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *foodName = [tableData objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSNumber *isChecked = [checkmarked objectAtIndex:indexPath.row];
    NSNumber *check;
    UIAlertView *messageAlert;
        
    if ([isChecked intValue] == 0){
        check = [NSNumber numberWithInt:1];
        messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Selected" message:foodName delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        check = [NSNumber numberWithInt:0];
        messageAlert = [[UIAlertView alloc] initWithTitle:@"Row Deselected" message:foodName delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    [checkmarked replaceObjectAtIndex:indexPath.row withObject:check];
    //[messageAlert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
