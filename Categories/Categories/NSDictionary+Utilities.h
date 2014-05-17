//
//  NSDictionary+Utilities.h
//
//
//  Created by Bogdan Bolchis on 02.07.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Utilities)

// Groups items in the array by property name
+ (NSDictionary *)dictionaryWithObjects:(NSArray *)items keyedByPropertyName:(NSString *)propertyName;

// Groups objects into sets, and then keys them by property name
+ (NSDictionary *)dictionaryWithSetsOfObjects:(NSArray *)objects keyedByPropertyName:(NSString *)propertyName;

// Groups objects into sets, and then keys them by the value at the key path
+ (NSDictionary *)dictionaryWithSetsOfObjects:(NSArray *)objects keyedByKeyPath:(NSString *)keyPath;

@end
