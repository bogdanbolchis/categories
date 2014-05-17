//
//  NSDateFormatter+Utilities.m
//  ParentPortal
//
//  Created by Bogdan Bolchis on 12.02.2014.
//  Copyright (c) 2014 Idared Software. All rights reserved.
//

#import "NSDateFormatter+Utilities.h"
#import "NSDate+Utilities.h"

@implementation NSDateFormatter (Utilities)

NSString *const kDateFormatWeekday = @"EE";
NSString *const kDateFormatLongFormWeekday = @"EEEE";
NSString *const kDateFormatYearMonthDay = @"yyyyMMdd";
NSString *const kDateFormatMonthDashDay = @"MM-dd";
NSString *const kDateFormatMonthDayYearSeparatorDash = @"MM-dd-yyyy";
NSString *const kDateFormatMonthDayShortYearSeparatorDash = @"MM-dd-yy";
NSString *const kDateFormatMonthDayYearSeparatorSlash = @"MM/dd/yyyy";
NSString *const kDateFormatMonthDayShortYearSeparatorSlash = @"MM/dd/yy";
NSString *const kDateFormatHoursMinutesSeconds = @"HHmmss";
NSString *const kDateFormatExtendedTimestamp = @"yyyyMMddHHmmssSSS";

+ (NSDateFormatter *)sharedFormatter {
	static NSDateFormatter *formatter;
	if (!formatter) {
		formatter = [[self alloc] init];
	}

	if (formatter.dateFormat) {
		formatter.dateFormat = nil;
	}
	if (formatter.timeStyle || formatter.dateStyle) {
		formatter.timeStyle = NSDateFormatterNoStyle;
		formatter.dateStyle = NSDateFormatterNoStyle;
	}
	return formatter;
}

+ (NSDate *)dateFromString:(NSString *)dateString dateFormat:(NSString *)dateFormat {
	NSDateFormatter *f = [self sharedFormatter];
	[f setDateFormat:dateFormat];
	return [f dateFromString:dateString];
}

+ (NSString *)stringFromDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
	NSDateFormatter *f = [self sharedFormatter];
	[f setDateFormat:dateFormat];
	return [f stringFromDate:date];
}

+ (NSString *)extendedTimestamp {
	NSDateFormatter *f = [self sharedFormatter];
	[f setDateFormat:kDateFormatExtendedTimestamp];
	return [f stringFromDate:[NSDate date]];
}

+ (NSDate *)dateFromExtendedTimestamp:(NSString *)timestamp {
	NSDateFormatter *f = [self sharedFormatter];
	[f setDateFormat:kDateFormatExtendedTimestamp];
	return [f dateFromString:timestamp];
}

+ (NSString *)relativeDateStringForDate:(NSDate *)startingDate {
	NSArray *components = [self relativeDateStringComponentsForDate:startingDate];
	return [components componentsJoinedByString:@" "];
}

+ (NSArray *)relativeDateStringComponentsForDate:(NSDate *)startingDate {
	static NSDateFormatter *timeFormatter;
	if (!timeFormatter) {
		timeFormatter = [[NSDateFormatter alloc] init];
		[timeFormatter setTimeStyle:NSDateFormatterShortStyle];
	}
	static NSDateFormatter *dateFormatter;
	if (!dateFormatter) {
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	}
	NSString *today = NSLocalizedString(@"Today.lowercase", nil);
	NSString *yesterday = NSLocalizedString(@"Yesterday.lowercase", nil);
	NSString *at = NSLocalizedString(@"At.lowercase", nil);
	NSArray *result;

	// Compute the number of days passed
	NSDate *endingDate = [NSDate date];
	NSInteger midnights = [NSDate midnightsFromDate:startingDate toDate:endingDate];
	if (midnights == 0) { // same day
		result = @[today, at, [timeFormatter stringFromDate:startingDate]];
	} else if (midnights == 1) { // yesterday
		result = @[yesterday, at, [timeFormatter stringFromDate:startingDate]];
	} else {
		result = @[[dateFormatter stringFromDate:startingDate], at, [timeFormatter stringFromDate:startingDate]];
	}
	return result;
}

@end
