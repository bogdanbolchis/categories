//
//  NSString+Utilities.m
//
//
//  Created by Bogdan Bolchiș on 1/19/12.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "CommonCrypto/CommonDigest.h"

#import "NSString+Utilities.h"
#import "NSNumberFormatter+Utilities.h"

@implementation NSString (Utilities)

- (NSString *)stringByTrimmingWhitespace {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingLeadingZeros {
	NSRange rangeOfZeros = [self rangeOfString:@"^0*" options:NSRegularExpressionSearch];
	return [self substringFromIndex:rangeOfZeros.location];
}

- (BOOL)isBlankString {
	return [[self stringByTrimmingWhitespace] length] == 0;
}

- (NSArray *)componentsBySplittingIntoPiecesOfLength:(NSUInteger)maxLength {
    NSMutableArray *resultMutable = [[NSMutableArray alloc] init];
	NSArray *lines = [self componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
	NSUInteger rowCount = 0;
	for (NSString *line in lines) {
		NSMutableArray *words = [[line componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] mutableCopy];
		NSMutableString *piece = [NSMutableString string];
		while ([words count] > 0) {
			NSString *word = words[0];
			// Check if we're at the beginning of a new line
			if ([piece length] == 0) {
				//  Add the word, or split it if it's too long
				if ([word length] <= maxLength) {
					[piece appendString:word];
					[words removeObjectAtIndex:0];
				} else {
                    [piece appendString:[word substringToIndex:maxLength]];
					NSString *newWord = [word substringFromIndex:maxLength];
					[words replaceObjectAtIndex:0 withObject:newWord];
				}
			} else {
				// Append a new word to the line, if it doesn't exceed maxLength number of characters
				if ([piece length] + [word length] + 1 <= maxLength) {
					[piece appendString:@" "];
					[piece appendString:word];
					[words removeObjectAtIndex:0];
				} else {
					[resultMutable addObject:[piece copy]];
					piece = [NSMutableString string];
					rowCount++;
				}
			}
			// Add the last part of the current row
			if ([words count] == 0 && [piece length] > 0) {
				[resultMutable addObject:[piece copy]];
				rowCount++;
			}
		}
	}
	return [NSArray arrayWithArray:resultMutable];
}

- (BOOL)belongsToCharacterSet:(NSCharacterSet *)charSet {
	NSRange range = [self rangeOfCharacterFromSet:charSet];
	return range.location != NSNotFound;
}

+ (NSString *)stringByFormattingCases:(int)cases andUnits:(int)units {
	NSString *result;

    if (cases != 0 && units != 0)
    {
        result = [NSString stringWithFormat:@"%d/%d", cases, units];
    }
    else if (cases != 0)
    {
        result = [NSString stringWithFormat:@"%d", cases];
    }
    else if (units != 0)
    {
        result = [NSString stringWithFormat:@"/%d", units];
    }

    return result;
}

- (NSString *)MD5Hash {
    if (self == nil || [self length] == 0) {
        return nil;
	}
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++) {
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

@end
