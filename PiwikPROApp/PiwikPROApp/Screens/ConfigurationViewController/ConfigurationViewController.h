//
//  ConfigurationViewController.h
//  PiwikTracker
//
//  Created by Mattias Levin on 01/06/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *dispatchIntervalField;
@property (weak, nonatomic) IBOutlet UISwitch *debugModeSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *prefixingSwitch;

- (IBAction)newSessionAction:(id)sender;
- (IBAction)dispatchEventsAction:(id)sender;

@end
