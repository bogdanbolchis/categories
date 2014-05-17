//
//  UINavigationBar+Utilities.h
//
//
//  Created by Bogdan Bolchis on 11.06.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Utilities)

// Shows/hides a view from behind the navigation bar. The view must conform to the specified protocol.
- (void)toggleSlidingView:(UIView *)slideOutView visible:(BOOL)makeVisible;

@end
