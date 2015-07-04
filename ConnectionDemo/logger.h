//
//  logger.h
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#ifndef ConnectionDemo_logger_h
#define ConnectionDemo_logger_h


@protocol LogEventHandler

-(void)onLogEvent:(NSString*)str;

@end

void LogEvent(NSString* format, ...);
void SetLogHandler(id<LogEventHandler> handler);

#endif
