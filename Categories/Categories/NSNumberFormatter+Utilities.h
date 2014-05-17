//
//  NSNumberFormatter+Utilities.h
//
//
//  Created by Bogdan Bolchis on 17.12.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (Utilities)

// Formats price values with the "$" prefix
+ (NSNumberFormatter *)currencyFormatter;

// Convenience
+ (NSNumberFormatter *)currencyCentsFormatter;
+ (NSNumberFormatter *)currencyDollarsFormatter;

// Even more convenience
+ (NSString *)centsFormattedAmountFromDollarAmount:(NSString *)amount;
+ (NSString *)dollarFormattedAmountFromCentsAmount:(NSString *)amount;

// Formats price values without the "$" prefix
+ (NSNumberFormatter *)twoDecimalsFormatter;

- (void)configureFormatForCents;
- (void)configureFormatForDollars;

@end
