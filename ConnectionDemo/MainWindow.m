//
//  MainWindow.m
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#import "MainWindow.h"
#import "logger.h"
#import "RootObject.h"

@interface MainWindow ()

@end

@implementation MainWindow
{
    NSConnection* _connectionServer;
    RootObject* _root;
    
}

-(void)onLogEvent:(NSString*)str
{
    NSString* oldstring = [_textview string];
    
    if ((oldstring == nil) || ([oldstring length] == 0))
    {
        [_textview setString:str];
    }
    else
    {
        NSString* oldstring= [_textview string];
        NSMutableString* newstring = [NSMutableString stringWithString:oldstring];
        [newstring appendString:@"\n"];
        [newstring appendString:str];
        [_textview setString:newstring];
        [_textview scrollToEndOfDocument:self];
    }
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    NSLog(@"Window did load");
    
    SetLogHandler(self);
    
    LogEvent(@"First log event");
    
    _root = [RootObject new];
}

- (void)windowWillClose:(NSNotification *)notification
{
    NSLog(@"window about to close");
    _root = nil;
    SetLogHandler(nil);
}

- (IBAction)onStartServerButton:(id)sender
{
    LogEvent(@"onStartServerButton");
    NSString* str = [_vendedObjectName stringValue];
    [_root startLocalServer:str];
}

- (IBAction)onStartClientButton:(id)sender
{
    LogEvent(@"onStartClientButton");
    NSString* str = [_clientConnectName stringValue];
    [_root startClientConnection:str];
}

- (IBAction)onSendMessageButton:(id)sender
{
    [_root sendMessage:@"This is a message"];
}

- (IBAction)onSendLoopbackMessageButton:(id)sender
{
    [_root sendLoopbackMessage:@"This is a loopback message"];
}

@end

