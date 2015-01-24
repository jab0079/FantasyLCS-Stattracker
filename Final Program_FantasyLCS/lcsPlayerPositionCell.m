//
//  lcsPlayerPositionCell.m
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsPlayerPositionCell.h"

@implementation lcsPlayerPositionCell

@synthesize labelMyPlayer = _labelMyPlayer;
@synthesize labelMyPlayerScore  = _labelMyPlayerScore;
@synthesize labelOppPlayer = _labelOppPlayer;
@synthesize labelOppPlayerScore = _labelOppPlayerScore;
@synthesize labelPosition = _labelPosition;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
