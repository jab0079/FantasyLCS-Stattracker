//
//  lcsPlayerPositionCell.h
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lcsPlayerPositionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelMyPlayer;
@property (weak, nonatomic) IBOutlet UILabel *labelMyPlayerScore;
@property (weak, nonatomic) IBOutlet UILabel *labelOppPlayer;
@property (weak, nonatomic) IBOutlet UILabel *labelOppPlayerScore;
@property (weak, nonatomic) IBOutlet UILabel *labelPosition;


@end
