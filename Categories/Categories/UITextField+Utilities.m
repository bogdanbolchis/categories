//
//  UITextField+Utilities.m
//
//
//  Created by Bogdan Bolchiș on 10/6/11.
//  Copyright 2011 Idared Software. All rights reserved.
//

#import "UITextField+Utilities.h"
#import "UIColor+Utilities.h"

@implementation UITextField (Utilities)

- (void)setRequiresInput:(BOOL)flag {
	if (flag) {
		[self doADance];
	}

	if (flag) {
		UIImage *image = [UIImage imageNamed:@"exclamation-triangle"];
		UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 24, 21)];
		leftView.image = image;
		self.leftView = leftView;
		self.leftViewMode = UITextFieldViewModeAlways;
	} else {
		self.leftView = nil;
	}
}

- (void)doADance {
	CABasicAnimation *theAnimation;
	theAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
	theAnimation.duration = 0.0625;
	theAnimation.repeatCount = 1;
	theAnimation.autoreverses = YES;
	theAnimation.fromValue = [NSNumber numberWithFloat:self.center.x - 3];
	theAnimation.toValue = [NSNumber numberWithFloat:self.center.x + 3];
	[self.layer addAnimation:theAnimation forKey:@"animatePosition"];
}

- (void)setEnabled:(BOOL)enabled andUpdateAlpha:(BOOL)updateAlpha {
	self.enabled = enabled;
	if (updateAlpha) {
		if (enabled) {
			self.alpha = 1.0;
		} else {
			self.alpha = 0.0;
		}
	}
}

- (BOOL)isAllTextSelected {
	UITextRange *beginningToEnd = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
	return ![[self selectedTextRange] isEmpty] && [self.selectedTextRange isEqual:beginningToEnd];
}

- (void)selectAllText {
	// Select the field contents. Needs to happen during the next run loop, otherwise due to an iOS 6 and 7 bug it will work only every other time.
	[self performSelector:@selector(selectAllTextIfSelfIsFirstResponder) withObject:nil afterDelay:0.0];
}

- (void)selectAllTextIfSelfIsFirstResponder {
    if ([self isFirstResponder]) {
        [self selectAll:nil];
    }
}

- (BOOL)input:(NSString *)input matchesPattern:(NSString *)pattern maxLength:(NSUInteger)maxLength {
	BOOL isBackspace = input && [input length] == 0;
	NSError *error;
	NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:&error];
	NSUInteger numMatches = [regex numberOfMatchesInString:input options:0 range:NSMakeRange(0, [input length])];
	BOOL isAllTextSelected = [self isAllTextSelected];
	return (numMatches > 0 && [self.text length] < maxLength) || (numMatches > 0 && isAllTextSelected) || isBackspace;
}

- (void)replaceRange:(NSRange)range withString:(NSString *)string {
	UITextPosition *beginning = self.beginningOfDocument;
	UITextPosition *changeBeginning = [self positionFromPosition:beginning offset:range.location];
	UITextPosition *changeEnd = [self positionFromPosition:changeBeginning offset:range.length];
	UITextRange *changeRange = [self textRangeFromPosition:changeBeginning toPosition:changeEnd];
	[self replaceRange:changeRange withText:string];
}

@end