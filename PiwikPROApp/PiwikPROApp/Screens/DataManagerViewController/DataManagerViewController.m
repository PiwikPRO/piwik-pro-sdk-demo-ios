//
//  DownloadViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 22/05/15.
//  Copyright (c) 2015 Mattias Levin. All rights reserved.
//

#import "DataManagerViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@implementation DataManagerViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString *email = [PiwikTracker sharedInstance].userEmail;
    NSString *userID = [PiwikTracker sharedInstance].userID;
    
    self.trackAttributes.enabled = true;
    if (email) {
        self.emailLabel.text = [NSString stringWithFormat:@"configured email: %@", email];
    } else if (userID) {
        self.emailLabel.text = [NSString stringWithFormat:@"configured userID: %@", userID];
    } else {
        self.emailLabel.text = @"email and userID not configured";
        self.trackAttributes.enabled = false;
    }
}

- (IBAction)sendAction:(id)sender
{
    NSString *name = self.nameField.text;
    NSString *value = self.valueField.text;
    [[PiwikTracker sharedInstance] sendProfileAttributeWithName:name value:value];
}

- (IBAction)getProfileAttributesAction:(id)sender {
    self.profileAttributes.text = @"STATUS: CHECKING";
    [[PiwikTracker sharedInstance] audienceManagerGetProfileAttributes:^(NSDictionary *profileAttributes, NSError * _Nullable error) {
        
        if (!error)
        {
            self.profileAttributes.text = [NSString stringWithFormat:@"Profile Attributes: %@", profileAttributes];
        }
        else
        {
            self.profileAttributes.text = @"STATUS: CONNECTION ERROR";
        }
    }];
}
@end
