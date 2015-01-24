//
//  lcsPlayerPickerViewController.h
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "lcsRoster.h"
#import "lcsTeam.h"
#import "lcsPlayer.h"

#define rosterComponent 0
#define playerComponent 1

@interface lcsPlayerPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>

@property (assign, nonatomic) NSInteger pos;
@property (strong, nonatomic) lcsRoster *myRoster;
@property (strong, nonatomic) lcsRoster *oppRoster;
@property (strong, nonatomic) NSArray *posPlayers;

@property (weak, nonatomic) IBOutlet UIPickerView *playerPicker;
@property (weak, nonatomic) IBOutlet UITextField *textKills;
@property (weak, nonatomic) IBOutlet UITextField *textDeaths;
@property (weak, nonatomic) IBOutlet UITextField *textAssists;
@property (weak, nonatomic) IBOutlet UITextField *textCS;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentMultiSelector;
@property (weak, nonatomic) IBOutlet UILabel *labelTriples;
@property (weak, nonatomic) IBOutlet UILabel *labelQuadras;
@property (weak, nonatomic) IBOutlet UILabel *labelPentas;
@property (weak, nonatomic) IBOutlet UISlider *sliderMultiValue;
@property (weak, nonatomic) IBOutlet UILabel *labelBonuses;
@property (weak, nonatomic) IBOutlet UILabel *labelKills;
@property (weak, nonatomic) IBOutlet UILabel *labelAssists;
@property (weak, nonatomic) IBOutlet UILabel *labelDeaths;
@property (weak, nonatomic) IBOutlet UILabel *labelCS;
@property (weak, nonatomic) IBOutlet UILabel *labelKDABonus;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

- (IBAction)updatePressed:(UIButton *)sender;
- (IBAction)toggleMultis:(UISegmentedControl *)sender;
- (IBAction)sliderChanged:(UISlider *)sender;
- (IBAction)valueChanged:(UIStepper *)sender;

@end
