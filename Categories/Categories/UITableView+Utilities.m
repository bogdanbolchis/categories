//
//  UITableView+Utilities.m
//
//
//  Created by Bogdan Bolchiș on 19.07.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "UITableView+Utilities.h"

@implementation UITableView (Utilities)

- (void)showCheckmarkForRowAtIndexPath:(NSIndexPath *)indexPath andHideCheckmarkAtIndexPath:(NSIndexPath *)oldIndexPath {
	[self deselectRowAtIndexPath:indexPath animated:NO];
    
	UITableViewCell *newCell = [self cellForRowAtIndexPath:indexPath];
	UITableViewCell *oldCell = [self cellForRowAtIndexPath:oldIndexPath];
    
	if ([newCell isEqual:oldCell]) {
		// Toggle checkmark if it's the same cell
		if (newCell.accessoryType == UITableViewCellAccessoryNone) {
			newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		} else {
			newCell.accessoryType = UITableViewCellAccessoryNone;
		}
	} else {
		newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		oldCell.accessoryType = UITableViewCellAccessoryNone;
	}
}

- (void)reloadDataDelayed {
	[self performSelector:@selector(reloadData) withObject:nil afterDelay:0.25];
}

- (UITableViewCell *)cellForRowContainingSubview:(UIView *)subview {
	// Get the center inside the subview's bounds.
	CGPoint center = CGPointMake(CGRectGetMidX(subview.bounds), CGRectGetMidY(subview.bounds));
	// Convert the center into the table view's coordinate system.
	CGPoint convertedPoint = [self convertPoint:center fromView:subview];
	// Find the index path, then return the corresponding cell.
	NSIndexPath *indexPath = [self indexPathForRowAtPoint:convertedPoint];
	return [self cellForRowAtIndexPath:indexPath];
}

@end
