//
//  NSURLResponse+Utilities.m
//
//
//  Created by Bogdan Bolchis on 23.09.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSURLResponse+Utilities.h"

@implementation NSURLResponse (Utilities)

- (NSInteger)statusCode {
	if ([self respondsToSelector:@selector(statusCode)]) {
		return [self statusCode];
	}

	return NSNotFound;
}

@end
