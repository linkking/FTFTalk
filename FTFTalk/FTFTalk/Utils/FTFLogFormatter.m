//
//  FTFLogFormatter.m
//  FTFTalk
//
//  Created by zhulei on 16/6/8.
//  Copyright © 2016年 oradt. All rights reserved.
//

#import "FTFLogFormatter.h"

@implementation FTFLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage {
    NSString *loglevel = nil;
    switch (logMessage.flag) {
        case DDLogFlagError: {
            loglevel = @"[ERROR]->";
        } break;
        case DDLogFlagWarning: {
            loglevel = @"[WARN]->";
        } break;
        case DDLogFlagInfo: {
            loglevel = @"[INFO]->";
        } break;
        case DDLogFlagDebug: {
            loglevel = @"[DEBUG]->";
        } break;
        case DDLogFlagVerbose: {
            loglevel = @"[VBOSE]----->";
        } break;

        default:
            break;
    }

    NSString *formatStr = [NSString
        stringWithFormat:
            @"%@, %@ FileName: %@ Function: %@  line[%ld] \ninfo: %@",
            [self getNowDateString], loglevel, logMessage->_fileName,
            logMessage->_function, logMessage->_line, logMessage->_message];
    return formatStr;
}

- (NSString *)getNowDateString {
    NSDate *nowdate = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateString = [format stringFromDate:nowdate];
    return dateString;
}
@end
