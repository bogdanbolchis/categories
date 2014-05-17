//
//  NSDateFormatter+Utilities.h
//  ParentPortal
//
//  Created by Bogdan Bolchis on 12.02.2014.
//  Copyright (c) 2014 Idared Software. All rights reserved.
//

#import "UIColor+Utilities.h"

@implementation UIColor (Utilities)

+ (UIColor *)randomColor {
	int rnd = arc4random() % 25;
	float frnd = (float)rnd;
	return [self colorWithRed:frnd/25.0 green:1 blue:frnd/25.0 alpha:1];
}

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
	NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
	
	// Strip # if it appears
	if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];

	// Separate into r, g, b substrings
	NSRange range = NSMakeRange(0, 2);
	NSString *rString = [cString substringWithRange:range];
	
	range.location = 2;
	NSString *gString = [cString substringWithRange:range];
	
	range.location = 4;
	NSString *bString = [cString substringWithRange:range];
	
	// Scan values
	unsigned r, g, b;
	[[NSScanner scannerWithString:rString] scanHexInt:&r];
	[[NSScanner scannerWithString:gString] scanHexInt:&g];
	[[NSScanner scannerWithString:bString] scanHexInt:&b];
	
	return [UIColor colorWithRed:((float)r / 255.0f)
						   green:((float)g / 255.0f)
							blue:((float)b / 255.0f)
						   alpha:1.0f];
}

@end
