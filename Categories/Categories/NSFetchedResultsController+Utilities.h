//
//  NSFetchedResultsController+Utilities.h
//
//
//  Created by Bogdan Bolchis on 28.02.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSFetchedResultsController (Utilities)

- (BOOL)performFetchOrLogError;

@end
