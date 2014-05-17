//
//  NSDate+Utilities.h
//
//
//  Created by Bogdan Bolchis on 27.09.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utilities)

/**
 @return Number of midnights between two dates or NSNotFound if any of the parameters is nil.
 */
+ (NSInteger)midnightsFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;

@end
