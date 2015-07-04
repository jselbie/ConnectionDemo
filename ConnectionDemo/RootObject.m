//
//  RootObject.m
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#import "RootObject.h"
#import "logger.h"

@implementation RootObject
{
    NSConnection* _serverConnection; // for listens to incoming connections
    
    NSConnection* _clientConnection; // outbound connection
    id _proxy;  // proxy from client to server
}

-(void)startLocalServer:(NSString*)str
{
    LogEvent(@"startLocalServer - enter");
    
    [self stopLocalServer];  // clean up any other thing that might be running
    _serverConnection = [NSConnection new];
    [_serverConnection setRootObject:self];
    [_serverConnection registerName:str];
    
    LogEvent(@"startLocalServer - leave");
}

-(void)stopLocalServer
{
    LogEvent(@"stopLocalServer - enter");
    
    [_serverConnection invalidate];
    _serverConnection = nil;
    
    LogEvent(@"stopLocalServer - leave");
}

-(void)startClientConnection:(NSString*)str
{
    LogEvent(@"startClientConnection %@ - enter", str);
    
    // tear down any older conneciton
    [self stopClientConnection];
    
    _clientConnection = [NSConnection connectionWithRegisteredName:str host:nil];
    
    if (_clientConnection == nil)
    {
        LogEvent(@"ERROR - _clientConnection is nil!");
    }
    else
    {
        _proxy = [_clientConnection rootProxy];
    }
    LogEvent(@"startClientConnection - leave", str);
    
    return;
}

-(void)stopClientConnection
{
    LogEvent(@"stopClientConnection - enter");
    _proxy = nil;
    [_clientConnection invalidate];
    _clientConnection = nil;
    LogEvent(@"stopClientConnection - leave");
    return;
}


// methods invoked through _clientProxy to the other instance's RootObject
-(void)sendMessage:(NSString*)msg
{
    LogEvent(@"sendMessage - enter");
    if (_proxy)
    {
        [_proxy Message:msg];
    }
    LogEvent(@"sendMessage - leave");
    
}

-(void)sendLoopbackMessage:(NSString*)msg
{
    LogEvent(@"sendLoopbackMessage - enter");
    if (_proxy)
    {
        [_proxy LoopbackMessage:msg];
    }
    LogEvent(@"sendLoopbackMessage - leave");
    
}

-(void)Message:(NSString*)str
{
    LogEvent(@"Received Message from other side: %@", str);
}

-(void)LoopbackMessage:(NSString*)str
{
    LogEvent(@"Received Loopback Message from other side: %@", str);
    LogEvent(@"About to send reply");
    [self sendMessage:str];
}


@end
