//
//  UITableViewCell+Utilities.h
//
//
//  Created by Bogdan Bolchis on 08.10.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Utilities)

// Configure the label to look like a button (centered text etc.)
- (void)configureForButtonAppearance;
- (void)configureForDisabledButtonAppearance;

/**
 Computes and returns the height for a cell containing a label that can be resized to fit its text
 @param label The label contained by the cell's content view
 @param labelBottomPadding Distance between the bottom of the label and the bottom of the cell's content view
 */
- (CGFloat)heightThatFitsLabel:(UILabel *)label labelBottomPadding:(CGFloat)labelBottomPadding;

/// Can be used for configuring a "disabled" look for cells.
/// @param enabled If NO, labels' text color will be gray.
- (void)configureForUserInteractionEnabledState:(BOOL)enabled;

/// Configures a background color depending on the index path.
- (void)configureAlternatingBackgroundColorForIndexPath:(NSIndexPath *)indexPath;

@end
