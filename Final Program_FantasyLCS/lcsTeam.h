//
//  lcsTeam.h
//  myFantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lcsTeam : NSObject

@property (strong) NSString *name;
@property (assign) NSInteger barons, drags, towers, fbs, wins;

- (CGFloat) getScore;

@end
