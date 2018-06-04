//
//  EcommerceViewController.m
//  PiwikTracker
//
//  Created by Mattias Levin on 26/01/14.
//  Copyright (c) 2014 Mattias Levin. All rights reserved.
//

#import "EcommerceViewController.h"
//#import "PiwikTransaction.h"
//#import "PiwikTransactionBuilder.h"
//#import "PiwikTracker.h"
#import <PiwikPROSDK/PiwikPROSDK.h>

static NSUInteger const ItemPrice = 1;

@implementation EcommerceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //[[PiwikTracker sharedInstance] sendViews:@[@"menu", @"transaction"]];

    // Start with one items
    self.numberOfItemsTextField.text = @"1";

    [self calculateCost];
}

- (IBAction)stepNumberOfItemsAction:(UIStepper *)sender
{
    self.numberOfItemsTextField.text = [NSString stringWithFormat:@"%.0f", sender.value];

    [self calculateCost];
}

- (IBAction)purchaseAction:(id)sender
{
    PiwikTransaction *transaction = [PiwikTransaction transactionWithBlock:^(PiwikTransactionBuilder *builder) {

        builder.identifier = [NSString stringWithFormat:@"Trans-%d", arc4random_uniform(1000)];
        builder.grandTotal = @([self.totalCostLabel.text floatValue]);
        builder.tax = @([self.taxLabel.text floatValue]);
        builder.shippingCost = @([self.shippingCostLabel.text floatValue]);
        builder.discount = nil;
        builder.subTotal = @([builder.grandTotal floatValue] - [builder.shippingCost floatValue]);

        //[builder addItemWithSku:@"SKU123"];

        if (self.numberOfItemsTextField.text.integerValue > 0)
        {
            [builder addItemWithSku:@"SKU123" name:@"Cookies" category:@"Food" price:@1.0 quantity:@([self.numberOfItemsTextField.text integerValue])];
        }

    }];

    [[PiwikTracker sharedInstance] sendTransaction:transaction];
}

- (void)calculateCost
{
    int numberOfItems = (int)[self.numberOfItemsTextField.text integerValue];

    int totalCost = numberOfItems * ItemPrice + 1;

    self.totalCostLabel.text = [NSString stringWithFormat:@"%d", totalCost];
    self.taxLabel.text = [NSString stringWithFormat:@"%.1f", totalCost * 0.3];
    self.shippingCostLabel.text = [NSString stringWithFormat:@"%.1f", MAX(1, (numberOfItems / 3)) * 0.1];
}

@end
