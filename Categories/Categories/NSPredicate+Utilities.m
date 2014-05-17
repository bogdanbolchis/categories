//
//  NSPredicate+Utilities.m
//
//
//  Created by Bogdan Bolchis on 20.03.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSPredicate+Utilities.h"

@implementation NSPredicate (Utilities)

+ (NSPredicate *)predicateFromSearchText:(NSString *)searchText searchedAttributesCount:(NSUInteger)searchedAttributesCount
{
    NSMutableCharacterSet *separatorSet = [[NSMutableCharacterSet alloc] init];
    [separatorSet formUnionWithCharacterSet:[NSCharacterSet whitespaceCharacterSet]];

	// Separate the search string components
	NSArray *components = [searchText componentsSeparatedByCharactersInSet:separatorSet];
	NSMutableString *predicateFormat = [NSMutableString string];

	// Prepare the predicate format
	NSUInteger validComponentsCount = 0;
    NSMutableArray *formatArguments = [[NSMutableArray alloc] initWithCapacity:2];
	for (NSString *comp in components) {
		NSUInteger index = [components indexOfObject:comp];
		if (index < searchedAttributesCount && comp.length > 0 && [comp rangeOfCharacterFromSet:separatorSet].location == NSNotFound) {
			if (validComponentsCount > 0) {
				[predicateFormat appendString:@" AND "];
			}
			[predicateFormat appendString:@"searchText CONTAINS[cd] %@"];
            [formatArguments addObject:comp];
			validComponentsCount++;
		}
	}

	NSPredicate *result;
	if (predicateFormat.length > 0) {
        result = [NSPredicate predicateWithFormat:predicateFormat argumentArray:formatArguments];
	}
	return result;
}


@end
