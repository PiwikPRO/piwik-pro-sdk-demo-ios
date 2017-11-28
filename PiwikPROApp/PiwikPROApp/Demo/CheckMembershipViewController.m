//
//  UserIDViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 16/10/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import "CheckMembershipViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@interface CheckMembershipViewController ()
@end

@implementation CheckMembershipViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)checkAction:(id)sender
{
    self.statusLabel.text = @"STATUS: CHECKING";
    [[PiwikTracker sharedInstance] checkMembershipWithAudienceID:self.audienceIDTextField.text completionBlock:^(BOOL isMember, NSError * _Nullable error) {
        
        if (!error)
        {
            self.statusLabel.text = isMember ? @"STATUS: USER IS A MEMBER" : @"STATUS: NOT A MEMBER";
        }
        else
        {
            self.statusLabel.text = @"STATUS: CONNECTION ERROR";
        }
    }];
}

- (IBAction)testAudienceAction:(id)sender
{
    self.audienceIDTextField.text = @"8dbac7b9-797c-44ef-92a3-aa6c2bd438c7";
}

@end
