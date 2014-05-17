//
//  NSDate+Utilities.m
//
//
//  Created by Bogdan Bolchis on 27.09.2013.
//  Copyright (c) 2013 Idared Software. All rights reserved.
//

#import "NSDate+Utilities.h"

@implementation NSDate (Utilities)

+ (NSInteger)midnightsFromDate:(NSDate *)startDate toDate:(NSDate *)endDate {
	if (!startDate || !endDate) {
		NSAssert(NO, @"Start or end date cannot be nil");
		return NSNotFound;
	}
	
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSInteger startDay = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:startDate];
    NSInteger endDay = [calendar ordinalityOfUnit:NSDayCalendarUnit inUnit:NSEraCalendarUnit forDate:endDate];
    return endDay - startDay;
}

@end
