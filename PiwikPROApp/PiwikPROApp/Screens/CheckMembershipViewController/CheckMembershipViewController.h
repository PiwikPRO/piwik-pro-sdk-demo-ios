//
//  UserIDViewController.h
//  PiwikTracker
//
//  Created by Mattias Levin on 16/10/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckMembershipViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *audienceIDTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)checkAction:(id)sender;

- (IBAction)testAudienceAction:(id)sender;

@end
