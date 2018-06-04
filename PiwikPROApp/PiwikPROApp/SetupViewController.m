//
//  SetupViewController.m
//  PiwikPROApp
//
//  Created by ShuZik on 04.06.2018.
//

#import "SetupViewController.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

static NSString *const defaultPiwikTestServerURL = @"https://demoaccess.piwik.pro/";
static NSString *const defaultPiwikTestSiteID = @"3e7e6ab9-d605-42b0-ac1b-cdf5bb5e216f";

@interface SetupViewController ()

@property (weak, nonatomic) IBOutlet UIView *fieldsView;
@property (weak, nonatomic) IBOutlet UIView *horizontalLine;
@property (weak, nonatomic) IBOutlet UITextField *serverUrlField;
@property (weak, nonatomic) IBOutlet UILabel *setiIdField;

@end

@implementation SetupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fieldsView.layer.cornerRadius = 8;
    self.fieldsView.layer.borderWidth = 1;
    self.fieldsView.layer.borderColor = UIColor.lightGrayColor.CGColor;
    self.horizontalLine.backgroundColor = UIColor.lightGrayColor;
}

- (IBAction)continuePress:(id)sender {
    
    if (self.serverUrlField.text.length > 0 && self.setiIdField.text.length > 0) {
        [self goToPiwikWithServerURL:self.serverUrlField.text andSiteId:self.setiIdField.text];
    }
    else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                       message:@"You didn't specify the serverURL and the siteID. Do you want to continue with the default settings?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* goAction = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self goToPiwikWithServerURL:defaultPiwikTestServerURL andSiteId:defaultPiwikTestSiteID];
        }];
        
        [alert addAction:goAction];
        
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)goToPiwikWithServerURL:(NSString *)serverURL andSiteId:(NSString *)siteID {
    [PiwikTracker sharedInstanceWithSiteID:siteID baseURL:[NSURL URLWithString:serverURL]];
    //[PiwikTracker sharedInstance].debug = YES;
    //[PiwikTracker sharedInstance].dispatchInterval = 10;
    [PiwikTracker sharedInstance].maxAgeOfQueuedEvents = 60 * 60 * 24 * 7;
    [[PiwikTracker sharedInstance] sendApplicationDownload];
    
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"MenuViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
