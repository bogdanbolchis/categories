//
//  NSFetchedResultsController+Utilities.m
//
//
//  Created by Bogdan Bolchis on 28.02.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSFetchedResultsController+Utilities.h"

@implementation NSFetchedResultsController (Utilities)

- (BOOL)performFetchOrLogError {
	NSError *error;
	BOOL success = [self performFetch:&error];
	if (!success) {
		NSLog(@"[Core Data] error performing fetch <%p>: %@", self, [error localizedDescription]);
		NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
		if (detailedErrors && detailedErrors.count > 0) {
			for (NSError* detailedError in detailedErrors) {
				NSLog(@"\t%@\r", [detailedError userInfo]);
			}
		} else {
			NSLog(@"[Core Data] error details: %@", [error userInfo]);
		}
	}
	return success;
}

@end
