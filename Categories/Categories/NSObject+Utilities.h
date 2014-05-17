//
//  NSObject+Utilities.h
//
//
//  Created by Bogdan Bolchiș on 1/12/12.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Utilities)

/// Returns the list of properties for a class
+ (NSArray *)classPropertyList;

/// Perform block after delay. Always executed on the main queue.
- (void)performAfterDelay:(NSTimeInterval)timeInterval block:(void (^)(void))block;

@end
