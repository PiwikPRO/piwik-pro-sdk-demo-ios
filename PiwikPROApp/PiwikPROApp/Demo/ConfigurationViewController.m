//
//  ConfigurationViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 01/06/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import "ConfigurationViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@implementation ConfigurationViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.debugModeSwitch.on = [PiwikTracker sharedInstance].debug;
    self.prefixingSwitch.on = [PiwikTracker sharedInstance].isPrefixingEnabled;
    self.dispatchIntervalField.text = @([PiwikTracker sharedInstance].dispatchInterval).stringValue;
}

- (IBAction)dispatchIntervalChangedAction:(id)sender
{
    [PiwikTracker sharedInstance].dispatchInterval = self.dispatchIntervalField.text.integerValue;
}

- (IBAction)switchChangedAction:(id)sender
{
    [PiwikTracker sharedInstance].debug = self.debugModeSwitch.on;
    [PiwikTracker sharedInstance].isPrefixingEnabled = self.prefixingSwitch.on;
}

- (IBAction)newSessionAction:(id)sender
{
    // Create a new session
    [PiwikTracker sharedInstance].sessionStart = YES;
}

- (IBAction)dispatchEventsAction:(id)sender
{
    // Dispatch queued events
    [[PiwikTracker sharedInstance] dispatch];
}

@end
