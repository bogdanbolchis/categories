//
//  NSObject+Utilities.m
//
//
//  Created by Bogdan Bolchiș on 1/12/12.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "NSObject+Utilities.h"
#import <objc/runtime.h>

@implementation NSObject (Utilities)

+ (NSArray *)classPropertyList {
	NSMutableArray *allProperties = [[NSMutableArray alloc] init];
	NSUInteger outCount, i;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        if (propName) {
            NSString *propertyName = [NSString stringWithUTF8String:propName];
            [allProperties addObject:propertyName];
        }
    }
    free(properties);

    return [NSArray arrayWithArray:allProperties];
}

- (void)performAfterDelay:(NSTimeInterval)delay block:(void (^)(void))block {
	double delayInSeconds = delay;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
	dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@end
