//
//  NSPredicate+Utilities.h
//
//
//  Created by Bogdan Bolchis on 20.03.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicate (Utilities)

// Returns a predicate configured to be used with the "searchText" key of NSManagedObjects that have one
// The predicate takes the searchText, and creates components separated by whitespace characters.
// The predicate then adds AND clauses, so that the components are matched against the object's searchText attribute (which should contain a number of the object's attributes concatenated into a string).
// E.g. ListItem.searchText contains a string with two concatenated values: itemNumber and itemDescription. In this case,
// the returned predicate when searching for "111 Cab", with searchedAttributesCount 2 would be:
// `searchText CONTAINS[cd] "111" AND searchText CONTAINS[cd] "Cab"`
+ (NSPredicate *)predicateFromSearchText:(NSString *)searchText searchedAttributesCount:(NSUInteger)searchedAttributesCount;

@end
