//
//  NSDateFormatter+Utilities.h
//  ParentPortal
//
//  Created by Bogdan Bolchis on 12.02.2014.
//  Copyright (c) 2014 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Utilities)

extern NSString *const kDateFormatWeekday;
extern NSString *const kDateFormatLongFormWeekday;
extern NSString *const kDateFormatYearMonthDay;
extern NSString *const kDateFormatMonthDashDay;
extern NSString *const kDateFormatMonthDayYearSeparatorDash;
extern NSString *const kDateFormatMonthDayShortYearSeparatorDash;
extern NSString *const kDateFormatMonthDayYearSeparatorSlash;
extern NSString *const kDateFormatMonthDayShortYearSeparatorSlash;
extern NSString *const kDateFormatHoursMinutesSeconds;
extern NSString *const kDateFormatExtendedTimestamp;

+ (NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat;

+ (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat;

+ (NSString *)extendedTimestamp;

+ (NSDate *)dateFromExtendedTimestamp:(NSString *)timestamp;

+ (NSString *)relativeDateStringForDate:(NSDate *)startingDate;

+ (NSArray *)relativeDateStringComponentsForDate:(NSDate *)startingDate;

@end
