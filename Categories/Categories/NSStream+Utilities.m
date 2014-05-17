//
//  NSStream+Utilities.m
//
//
//  Created by Bogdan Bolchis on 04.10.2012.
//  Copyright (c) 2012 Idared Software. All rights reserved.
//

#import "NSStream+Utilities.h"

@implementation NSStream (Utilities)


+ (void)getStreamsToHostNamed:(NSString *)hostName port:(NSInteger)port inputStream:(out NSInputStream **)inputStream outputStream:(out NSOutputStream **)outputStream
{
    CFHostRef           host;
    CFReadStreamRef     readStream;
    CFWriteStreamRef    writeStream;
	
    readStream = NULL;
    writeStream = NULL;
    
    host = CFHostCreateWithName(NULL, (__bridge CFStringRef) hostName);
    if (host != NULL) {
        (void) CFStreamCreatePairWithSocketToCFHost(NULL, host, port, &readStream, &writeStream);
        CFRelease(host);
    }
    
    if (inputStream == NULL) {
        if (readStream != NULL) {
            CFRelease(readStream);
        }
    } else {
        *inputStream = (__bridge NSInputStream *)readStream;
    }
    if (outputStream == NULL) {
        if (writeStream != NULL) {
            CFRelease(writeStream);
        }
    } else {
        *outputStream = (__bridge NSOutputStream *)writeStream;
    }
}


@end
