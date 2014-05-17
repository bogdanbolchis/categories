//
//  NSStream+Utilities.h
//
//
//  Created by Bogdan Bolchis on 04.10.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSStream (Utilities)

+ (void)getStreamsToHostNamed:(NSString *)hostName port:(NSInteger)port inputStream:(out NSInputStream **)inputStream outputStream:(out NSOutputStream **)outputStream;

@end
