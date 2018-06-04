//
//  CustomVariablesViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 17/08/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import "CustomDimensionsViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@implementation CustomDimensionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)customDimensionAAction:(id)sender
{
    [[PiwikTracker sharedInstance] setCustomDimensionForIndex:1 value:@"Admin (dimension with visit scope)" scope:CustomDimensionScopeVisit];
}

- (IBAction)customDimensionBAction:(id)sender
{
    NSArray *values = @[ @"green", @"red", @"blue" ];

    [[PiwikTracker sharedInstance] setCustomDimensionForIndex:2 value:[NSString stringWithFormat:@"%@ (dimension with action scope)", values[arc4random_uniform(3)]] scope:CustomDimensionScopeAction];
}

@end
