//
//  UserIDViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 16/10/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import "UserIDViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@interface UserIDViewController ()
@end

@implementation UserIDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self toggleState];
}

- (void)toggleState
{
    self.userIDTextField.text = [PiwikTracker sharedInstance].userID;
    self.emailTextField.text = [PiwikTracker sharedInstance].userEmail;
}

- (IBAction)signinAction:(id)sender
{
    NSLog(@"Sign in");

    [PiwikTracker sharedInstance].userID = self.userIDTextField.text.length > 0 ? self.userIDTextField.text : nil;
    [PiwikTracker sharedInstance].userEmail = self.emailTextField.text.length > 0 ? self.emailTextField.text : nil;
    [self toggleState];
}

- (IBAction)signOutAction:(id)sender
{
    NSLog(@"Sign out");

    [PiwikTracker sharedInstance].userID = nil;
    [PiwikTracker sharedInstance].userEmail = nil;
    [self toggleState];
}

@end
