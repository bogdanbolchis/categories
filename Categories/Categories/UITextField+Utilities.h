//
//  UITextField+Utilities.h
//
//
//  Created by Bogdan Bolchiș on 10/6/11.
//  Copyright 2011 Idared Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/QuartzCore.h"

@interface UITextField (Utilities)

/// If YES, surrounds the text field with a red halo and shakes the field to signify that the fields requires input.
- (void)setRequiresInput:(BOOL)flag;

/// Enables the field and optionally updates its alpha value.
- (void)setEnabled:(BOOL)enabled andUpdateAlpha:(BOOL)updateAlpha;

/// Selects all text.
- (void)selectAllText;

/// YES if the selection range includes all of the text.
- (BOOL)isAllTextSelected;

/// YES if the input matches the regex pattern and the text field's length is less than maxLength.
- (BOOL)input:(NSString *)input matchesPattern:(NSString *)pattern maxLength:(NSUInteger)maxLength;

/// Intended to be used from -textField:shouldChangeCharactersInRange:replacementString:,
/// maybe in combination with -input:matchesPattern:maxLength:. See example implementation in CreateAccountTableViewController.
- (void)replaceRange:(NSRange)range withString:(NSString *)string;

@end