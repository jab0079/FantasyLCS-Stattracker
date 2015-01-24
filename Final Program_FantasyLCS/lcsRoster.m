//
//  lcsRoster.m
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsRoster.h"
#import "lcsTeam.h"
#import "lcsPlayer.h"

@implementation lcsRoster

- (id)init  {
    self = [super init];
    
    if (self) {
        self.name = @"-team name-";
        self.players = [[NSMutableArray alloc] init];
        for (int i = 0; i < 6; i++) {
            lcsPlayer *player = [[lcsPlayer alloc] init];
            player.pos = i;
            player.position = [player getPosition];
            [self.players addObject:player];
        }
        lcsTeam *team = [[lcsTeam alloc] init];
        [self.players addObject:team];
        self.score = 0;
    }
    
    return self;
}

- (CGFloat) calcScore {
    CGFloat newScore;
    for (int i = 0; i < 7; i++) {
        newScore += [self.players[i] getScore];
    }
    self.score = newScore;
    return newScore;
}

@end
