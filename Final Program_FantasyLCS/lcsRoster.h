//
//  lcsRoster.h
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lcsRoster : NSObject

@property (strong) NSString *name;
@property (strong) NSMutableArray *players;
@property (assign) CGFloat score;

- (CGFloat) calcScore;

@end
