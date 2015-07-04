//
//  MainWindow.h
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "logger.h"

@interface MainWindow : NSWindowController <LogEventHandler>

@property (unsafe_unretained) IBOutlet NSTextView *textview;
@property (weak) IBOutlet NSTextField *vendedObjectName;
@property (weak) IBOutlet NSTextField *clientConnectName;

-(void)onLogEvent:(NSString*)str;

@property (weak) IBOutlet NSButton *startServerButton;
@property (weak) IBOutlet NSButton *startClientButton;
@property (weak) IBOutlet NSButton *sendMessageButton;
@property (weak) IBOutlet NSButton *sendLoopbackMessageButton;

- (IBAction)onStartServerButton:(id)sender;
- (IBAction)onStartClientButton:(id)sender;
- (IBAction)onSendMessageButton:(id)sender;
- (IBAction)onSendLoopbackMessageButton:(id)sender;

@end
