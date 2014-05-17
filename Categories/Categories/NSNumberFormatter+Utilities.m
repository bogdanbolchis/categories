//
//  NSNumberFormatter+Utilities.m
//
//
//  Created by Bogdan Bolchis on 17.12.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "NSNumberFormatter+Utilities.h"

@implementation NSNumberFormatter (Utilities)

+ (NSNumberFormatter *)currencyFormatter {
	NSNumberFormatter *currencyFormatter = [[self alloc] init];
	currencyFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
	currencyFormatter.minimumSignificantDigits = 1;
	currencyFormatter.maximumFractionDigits = 2;
	currencyFormatter.minimumFractionDigits = 2;
	currencyFormatter.negativePrefix = @"-$";
	currencyFormatter.negativeSuffix = @"";
	currencyFormatter.locale = [NSLocale currentLocale];

	return currencyFormatter;
}

+ (NSNumberFormatter *)currencyCentsFormatter {
	static NSNumberFormatter *formatter;
	if (!formatter) {
		formatter = [self currencyFormatter];
		[formatter configureFormatForCents];
	}
	return formatter;
}

+ (NSNumberFormatter *)currencyDollarsFormatter {
	static NSNumberFormatter *formatter;
	if (!formatter) {
		formatter = [self currencyFormatter];
		[formatter configureFormatForDollars];
	}
	return formatter;
}

+ (NSNumberFormatter *)twoDecimalsFormatter {
	static NSNumberFormatter *twoDecimalsFormatter = nil;
	if (!twoDecimalsFormatter) {
		twoDecimalsFormatter = [[self alloc] init];

		// Use a two-decimal formatter for some cells
		[twoDecimalsFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
		[twoDecimalsFormatter setMinimumFractionDigits:2];
		[twoDecimalsFormatter setMaximumFractionDigits:2];
	}

	return twoDecimalsFormatter;
}

+ (NSNumberFormatter *)currencyFormatterForUploadFiles {
	static NSNumberFormatter *formatter;
	if (!formatter) {
		formatter = [[NSNumberFormatter alloc] init];
		formatter.numberStyle = NSNumberFormatterNoStyle;
		formatter.negativePrefix = @"";
		formatter.multiplier = @100;
	}
	return formatter;
}

- (void)configureFormatForCents {
	[self setMultiplier:@100];
	[self setNumberStyle:NSNumberFormatterNoStyle];
	[self setMaximumFractionDigits:0];
}

- (void)configureFormatForDollars {
	[self setMultiplier:@1];
	[self setNumberStyle:NSNumberFormatterCurrencyStyle];
	[self setMinimumFractionDigits:2];
	[self setMaximumFractionDigits:2];
}

+ (NSString *)centsFormattedAmountFromDollarAmount:(NSString *)amount {
	NSNumber *value = [[self currencyDollarsFormatter] numberFromString:amount];
	return [[self currencyCentsFormatter] stringFromNumber:value];
}

+ (NSString *)dollarFormattedAmountFromCentsAmount:(NSString *)amount {
	NSNumber *value = [[self currencyCentsFormatter] numberFromString:amount];
	return [[self currencyDollarsFormatter] stringFromNumber:value];
}

@end
