//
//  DownloadViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 22/05/15.
//  Copyright (c) 2015 Mattias Levin. All rights reserved.
//

#import "OutlinkViewController.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

@implementation OutlinkViewController

- (IBAction)outlinkAction:(id)sender
{
    [[PiwikTracker sharedInstance] sendOutlink:@"http://google.com"];
}

@end
