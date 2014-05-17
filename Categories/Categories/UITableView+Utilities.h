//
//  UITableView+Utilities.h
//
//
//  Created by Bogdan Bolchiș on 19.07.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Utilities)

// Used for tables with exclusive selection (selecting one row will deselect the previously selected row) 
- (void)showCheckmarkForRowAtIndexPath:(NSIndexPath *)indexPath andHideCheckmarkAtIndexPath:(NSIndexPath *)oldIndexPath;

// Performs a reloadData, after an interval equal to STANDARD_ANIMATION_DURATION. This gives enough time to any previous animation to complete.
- (void)reloadDataDelayed;

// Returns the row containing a certain subview
- (UITableViewCell *)cellForRowContainingSubview:(UIView *)subview;

@end
