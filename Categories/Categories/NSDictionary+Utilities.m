//
//  NSDictionary+Utilities.m
//
//
//  Created by Bogdan Bolchis on 02.07.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSDictionary+Utilities.h"

@implementation NSDictionary (Utilities)

+ (NSDictionary *)dictionaryWithObjects:(NSArray *)objects keyedByPropertyName:(NSString *)propertyName {
	NSAssert([objects count], @"A non-empty array is required.");
	NSAssert1([[objects lastObject] respondsToSelector:NSSelectorFromString(propertyName)], @"The objects must have a property called '%@'.", propertyName);
	NSAssert1([[[objects lastObject] valueForKey:propertyName] conformsToProtocol:@protocol(NSCopying)], @"The value for the property called '%@' must conform to <NSCopying>.", propertyName);

	// Asserts are ignored in release builds, so return nil as a precaution.
	if (![objects count]) {
		return nil;
	}

	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[objects count]];
	for (id item in objects) {
		NSString *key = [item valueForKey:propertyName];
		dict[key] = item;
	}
	
	return [NSDictionary dictionaryWithDictionary:dict];
}

+ (NSDictionary *)dictionaryWithSetsOfObjects:(NSArray *)objects keyedByPropertyName:(NSString *)propertyName {
	NSAssert1([[objects lastObject] respondsToSelector:NSSelectorFromString(propertyName)], @"The objects must have a property called '%@'.", propertyName);
	return [self dictionaryWithSetsOfObjects:objects keyedByKeyPath:propertyName];
}

+ (NSDictionary *)dictionaryWithSetsOfObjects:(NSArray *)objects keyedByKeyPath:(NSString *)keyPath {
	NSAssert([objects count], @"A non-empty array is required.");
	NSAssert1([[[objects lastObject] valueForKeyPath:keyPath] conformsToProtocol:@protocol(NSCopying)], @"The value for the property called '%@' must conform to <NSCopying>.", keyPath);

	// Asserts are ignored in release builds, so return nil as a precaution.
	if (![objects count]) {
		return nil;
	}

	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[objects count]];
	for (id item in objects) {
		NSString *key = [item valueForKeyPath:keyPath];
        if (key) {
            NSMutableSet *set = dict[key];
            if (!set) {
                set = [NSMutableSet set];
                dict[key] = set;
            }
            [set addObject:item];
        }
	}

	return [NSDictionary dictionaryWithDictionary:dict];
}

@end
