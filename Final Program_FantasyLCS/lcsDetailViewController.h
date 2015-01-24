//
//  lcsDetailViewController.h
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/23/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lcsDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
