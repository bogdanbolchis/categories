//
//  UINavigationBar+Utilities.m
//
//
//  Created by Bogdan Bolchis on 11.06.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "UINavigationBar+Utilities.h"

@implementation UINavigationBar (Utilities)

- (void)toggleSlidingView:(UIView *)slidingView visible:(BOOL)makeVisible {
	if (makeVisible) {
		// Position the slide-out view before making it visible the center of the slide-out view
		slidingView.center = self.center;

		// Add as subview
		[self.superview insertSubview:slidingView belowSubview:self];
	}

	// Animate the y origin
	[UIView animateWithDuration:0.25 animations:^{
		CGRect frame = slidingView.frame;
		if (makeVisible) {
			frame.origin.y = CGRectGetMaxY(frame);
		} else {
			frame.origin.y = 0;
		}
		slidingView.frame = CGRectIntegral(frame);
	} completion:^(BOOL finished) {
		// Remove from superview when finished
		if (!makeVisible) {
			[slidingView removeFromSuperview];
		}
		
		[slidingView setHidden:!makeVisible];
	}];
}

@end
