//
//  lcsDetailViewController.m
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/23/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsDetailViewController.h"

@interface lcsDetailViewController ()
- (void)configureView;
@end

@implementation lcsDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
