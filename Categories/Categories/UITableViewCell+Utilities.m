//
//  UITableViewCell+Utilities.m
//
//
//  Created by Bogdan Bolchis on 08.10.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "UITableViewCell+Utilities.h"

#import "UIColor+Utilities.h"

@implementation UITableViewCell (Utilities)

- (void)configureForButtonAppearance {
	self.textLabel.textAlignment = NSTextAlignmentCenter;
	self.textLabel.font = [UIFont boldSystemFontOfSize:15];
	self.userInteractionEnabled = YES;
}

- (void)configureForDisabledButtonAppearance {
	// The opposite state of -configureForButtonAppearance
	self.textLabel.textAlignment = NSTextAlignmentCenter;
	self.textLabel.font = [UIFont boldSystemFontOfSize:15];
	self.textLabel.textColor = [UIColor lightGrayColor];
	self.userInteractionEnabled = NO;
}

- (CGFloat)heightThatFitsLabel:(UILabel *)label labelBottomPadding:(CGFloat)labelBottomPadding {
	BOOL showsDisclosureIndicator = self.accessoryType == UITableViewCellAccessoryDisclosureIndicator;
	CGFloat disclosureIndicatorOffset = showsDisclosureIndicator ? 20 : 0;
	CGFloat maxWidth = CGRectGetWidth(label.bounds) - disclosureIndicatorOffset;
	CGSize maxSize = CGSizeMake(maxWidth, 10 * 44);
	CGRect boundingRect = [label.text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
	CGFloat cellHeight = CGRectGetMinY(label.frame) + boundingRect.size.height + labelBottomPadding;
	return cellHeight;
}

- (void)configureForUserInteractionEnabledState:(BOOL)enabled {
	self.userInteractionEnabled = enabled;
	for (UIView *view in [self.contentView subviews]) {
		if ([view isKindOfClass:[UILabel class]]) {
			[(UILabel *)view setTextColor:enabled ? [UIColor blackColor] : [UIColor lightGrayColor]];
		}
	}
}

- (void)configureAlternatingBackgroundColorForIndexPath:(NSIndexPath *)indexPath {
	BOOL isEvenRow = indexPath.row == 0 || indexPath.row % 2 == 0;
	if (isEvenRow) {
		self.backgroundColor = [UIColor lightGrayColor];
	} else {
		self.backgroundColor = [UIColor whiteColor];
	}
}

@end
