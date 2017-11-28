//
//  MasterViewController.m
//  PiwikTrackeriOSDemo
//
//  Created by Mattias Levin on 9/16/13.
//  Copyright (c) 2013 Mattias Levin. All rights reserved.
//

#import "MenuViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sessionStart:) name:PiwikSessionStartNotification object:nil];

    // Report screen view to Piwik
    [[PiwikTracker sharedInstance] sendView:@"menu"];
}

- (void)sessionStart:(NSNotification *)notification
{
    NSLog(@"Session start notification");
    // Set up any visit custom variables
}

@end
