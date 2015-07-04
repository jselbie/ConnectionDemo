//
//  RootObject.h
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommonProtocol

-(void)Message:(NSString*)str;
-(void)LoopbackMessage:(NSString*)str;

@end



@interface RootObject : NSObject <CommonProtocol>

-(void)Message:(NSString*)str;
-(void)LoopbackMessage:(NSString*)str;


-(void)startLocalServer:(NSString*)str;
-(void)stopLocalServer;
-(void)startClientConnection:(NSString*)str;
-(void)stopClientConnection;
-(void)sendMessage:(NSString*)msg;
-(void)sendLoopbackMessage:(NSString*)msg;

@end
