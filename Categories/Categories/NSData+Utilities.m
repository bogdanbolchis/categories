//
//  NSData+Utilities.m
//
//
//  Created by Bogdan Bolchiș on 09.05.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "NSData+Utilities.h"

@implementation NSData (Utilities)

- (NSData *)dataByStrippingNullCharacters {
	NSData *result = self;
	
	unsigned char zeroByte = 0;
	NSData *zeroByteData = [NSData dataWithBytes:&zeroByte length:1];
	
	NSRange rangeOfNullChar = [result rangeOfData:zeroByteData options:kNilOptions range:NSMakeRange(0, [result length])];
	while (rangeOfNullChar.location != NSNotFound) {
		NSMutableData *mutable = [result mutableCopy];
		[mutable replaceBytesInRange:rangeOfNullChar withBytes:NULL length:0];
		result = [NSData dataWithData:mutable];
		rangeOfNullChar = [result rangeOfData:zeroByteData options:kNilOptions range:NSMakeRange(0, [result length])];
	}
	
	return result;
}

@end
