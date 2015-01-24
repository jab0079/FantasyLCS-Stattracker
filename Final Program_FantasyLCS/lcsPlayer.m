//
//  lcsPlayer.m
//  myFantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsPlayer.h"

@implementation lcsPlayer

// Initialize an empty lcsPlayer object
- (id)init  {
    self = [super init];
    
    if (self) {
        self.name = @"-player-";
        self.pos = 0;
        self.position = self.getPosition;
        self.kills = 0;
        self.deaths = 0;
        self.assists = 0;
        self.cs = 0;
        self.triples = 0;
        self.quadras = 0;
        self.pentas = 0;
        self.bonuses = 0;
    }
    
    return self;
}

// Get player position string from position number
- (NSString *) getPosition {
    NSString *getPos;
    switch (self.pos) {
        case 0:
            getPos = @"TOP";
            break;
        case 1:
            getPos = @"JGL";
            break;
        case 2:
            getPos = @"MID";
            break;
        case 3:
            getPos = @"ADC";
            break;
        case 4:
            getPos = @"SUP";
            break;
        case 5:
            getPos = @"FLEX";
            break;
        default:
            getPos = @"";
            break;
    }
    return getPos;
}

// Calculate score from player stats
- (CGFloat) getScore {
    return (self.kills * 2 + self.deaths * -0.5 + self.assists * 1.5 + self.cs * 0.01 + self.triples * 2 + self.quadras * 5 + self.pentas * 10 + self.bonuses * 2);
}

@end
