//
//  NSManagedObjectContext+Utilities.m
//
//
//  Created by Bogdan Bolchis on 06.02.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSManagedObjectContext+Utilities.h"

@implementation NSManagedObjectContext (Utilities)

- (BOOL)saveOrLogError
{
    BOOL success = YES;
    if (![self hasChanges]) {
        return success;
    }
    NSError *error;
    success = [self save:&error];
    if (!success) {
        NSLog(@"[Core Data] error saving context <%p>: %@", self, [error localizedDescription]);
        NSArray *detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
        if (detailedErrors && detailedErrors.count > 0) {
            for (NSError *detailedError in detailedErrors) {
                NSLog(@"\t%@\r", [detailedError userInfo]);
            }
        } else {
            NSLog(@"[Core Data] error details: %@", [error userInfo]);
        }
        NSString *message = [NSString stringWithFormat:@"[Core Data] error saving context %@", [error localizedDescription]];
		NSLog(@"%@", message);
    }
    return success;
}

- (NSArray *)executeFetchRequestOrLogError:(NSFetchRequest *)fetchRequest
{
    NSError *error = nil;
    NSArray *results = [self executeFetchRequest:fetchRequest error:&error];
    if (error) {
        NSLog(@"[Core Data] %@; fetch request: %@", [error localizedDescription], fetchRequest);
    }
    return results;
}

@end
