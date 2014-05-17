//
//  NSNumber+Utilities.m
//
//
//  Created by Bogdan Bolchis on 18.02.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSNumber+Utilities.h"

@implementation NSNumber (Utilities)

- (NSNumber *)numberByIncrementingByOne {
	return [self numberByIncrementingBy:1];
}

- (NSNumber *)numberByIncrementingBy:(NSInteger)value {
	return [NSNumber numberWithInteger:self.integerValue + value];
}

@end
