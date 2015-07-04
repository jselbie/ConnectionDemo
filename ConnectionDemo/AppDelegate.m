//
//  AppDelegate.m
//  ConnectionDemo
//
//  Created by jselbielocal on 7/2/15.
//  Copyright (c) 2015 jselbielocal. All rights reserved.
//

#import "AppDelegate.h"
#import "MainWindow.h"
#include "logger.h"

@implementation AppDelegate
{
    MainWindow* _window;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

    
    _window = [[MainWindow alloc] initWithWindowNibName:@"MainWindow"];
    
    [_window showWindow:self];


    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
