//
//  NSManagedObjectContext+Utilities.h
//
//
//  Created by Bogdan Bolchis on 06.02.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Utilities)

- (BOOL)saveOrLogError;

- (NSArray *)executeFetchRequestOrLogError:(NSFetchRequest *)request;

@end
