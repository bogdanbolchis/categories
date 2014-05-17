//
//  NSString+Utilities.h
//
//
//  Created by Bogdan Bolchiș on 1/19/12.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utilities)

/// Trims all whitespace.
- (NSString *)stringByTrimmingWhitespace;

/// Trims leading zeros.
- (NSString *)stringByTrimmingLeadingZeros;

/// YES for blank strings.
- (BOOL)isBlankString;

/// Splits a string into fixed length components.
- (NSArray *)componentsBySplittingIntoPiecesOfLength:(NSUInteger)maxLength;

/// YES if a string belongs to a certain character set.
- (BOOL)belongsToCharacterSet:(NSCharacterSet *)charSet;

/// Returns an MD5 hash
- (NSString *)MD5Hash;

@end
