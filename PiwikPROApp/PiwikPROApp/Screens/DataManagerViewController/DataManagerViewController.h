//
//  DownloadViewController.h
//  PiwikTracker
//
//  Created by Mattias Levin on 22/05/15.
//  Copyright (c) 2015 Mattias Levin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataManagerViewController : UIViewController
- (IBAction)getProfileAttributesAction:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *profileAttributes;
@property (weak, nonatomic) IBOutlet UIButton *getProfileAttributes;
@property (weak, nonatomic) IBOutlet UIButton *trackAttributes;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

- (IBAction)sendAction:(id)sender;

@end
