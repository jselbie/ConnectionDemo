//
//  logger.m
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainWindow.h"
#import "logger.h"

static id<LogEventHandler> s_loghandler;

void SetLogHandler(id<LogEventHandler> handler)
{
    s_loghandler = handler;
}


void LogEvent(NSString* format, ...)
{
    va_list list;
    va_start(list, format);
    
    NSString* str = [[NSString alloc] initWithFormat:format arguments:list];
    
    NSLog(@"%@", str);
    
    [s_loghandler onLogEvent:str];
    
    va_end(list);
}

