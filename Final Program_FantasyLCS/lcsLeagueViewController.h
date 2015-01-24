//
//  lcsLeagueViewController.h
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lcsLeagueViewController : UITableViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *labelMyTeam;
@property (weak, nonatomic) IBOutlet UILabel *labelOppTeam;
@property (weak, nonatomic) IBOutlet UILabel *labelMyScore;
@property (weak, nonatomic) IBOutlet UILabel *labelOppScore;

@end
