//
//  lcsPlayer.h
//  myFantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface lcsPlayer : NSObject

@property (strong) NSString *name, *position;
@property (assign) NSInteger pos, kills, deaths, assists, cs, triples, quadras, pentas, bonuses;

- (NSString *) getPosition;
- (CGFloat) getScore;

@end
