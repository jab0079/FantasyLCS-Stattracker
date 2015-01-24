//
//  lcsTeam.m
//  myFantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsTeam.h"
#import "lcsPlayer.h"

@implementation lcsTeam

// Initialize an empty lcsTeam object
- (id)init  {
    self = [super init];
    
    if (self) {
        self.name = @"-team-";
        self.barons = 0;
        self.drags = 0;
        self.towers = 0;
        self.fbs = 0;
        self.wins = 0;
    }
    
    return self;
}

// Calculate score from team stats
- (CGFloat) getScore {
    return ((self.barons + self.fbs + self.wins) * 2 + self.drags + self.towers);
}

@end
