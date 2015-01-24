//
//  lcsPlayerPickerViewController.m
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsPlayerPickerViewController.h"
#import "lcsLeagueViewController.h"
#import "lcsRoster.h"
#import "lcsPlayer.h"
#import "lcsTeam.h"

@interface lcsPlayerPickerViewController ()
{
    lcsPlayer *_selectedPlayer;
    lcsTeam *_selectedTeam;
}
- (void) configureView;
@end


@implementation lcsPlayerPickerViewController

- (void)configureView
{
    // Update the user interface for the player items.
    if (self.pos != 6) {
        if ([self.posPlayers containsObject:_selectedPlayer.name]) {
            NSInteger playerIndex = [self.posPlayers indexOfObject:_selectedPlayer.name];
            [self.playerPicker selectRow:playerIndex inComponent:playerComponent animated:NO];
        }
        self.textKills.text = [NSString stringWithFormat:@"%d",_selectedPlayer.kills];
        self.textDeaths.text = [NSString stringWithFormat:@"%d",_selectedPlayer.deaths];
        self.textAssists.text = [NSString stringWithFormat:@"%d",_selectedPlayer.assists];
        self.textCS.text = [NSString stringWithFormat:@"%d",_selectedPlayer.cs];
        self.labelTriples.text = [NSString stringWithFormat:@"%d",_selectedPlayer.triples];
        self.labelQuadras.text = [NSString stringWithFormat:@"%d",_selectedPlayer.quadras];
        self.labelPentas.text = [NSString stringWithFormat:@"%d",_selectedPlayer.pentas];
        self.labelBonuses.text = [NSString stringWithFormat:@"%d",_selectedPlayer.bonuses];
    } else {
        // set team stat field from selected team
        if ([self.posPlayers containsObject:_selectedTeam.name]) {
            NSInteger playerIndex = [self.posPlayers indexOfObject:_selectedTeam.name];
            [self.playerPicker selectRow:playerIndex inComponent:playerComponent animated:YES];
        }
        self.textKills.text = [NSString stringWithFormat:@"%d",_selectedTeam.drags];
        self.textDeaths.text = [NSString stringWithFormat:@"%d",_selectedTeam.barons];
        self.textAssists.text = [NSString stringWithFormat:@"%d",_selectedTeam.wins];
        self.textCS.text = [NSString stringWithFormat:@"%d",_selectedTeam.fbs];
        self.labelBonuses.text = [NSString stringWithFormat:@"%d",_selectedTeam.towers];
    }

}




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *plistURL = [[NSBundle mainBundle] URLForResource:@"playerDatabase" withExtension:@"plist"];
    NSMutableArray *playerNames = [NSMutableArray arrayWithContentsOfURL:plistURL];
    if (self.pos < 5) {
        self.posPlayers = [playerNames[self.pos] sortedArrayUsingSelector:@selector(compare:)];
    } else if (self.pos == 5) {
        NSMutableArray *allPlayers = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; i++) {
            [allPlayers addObjectsFromArray:playerNames[i]];
        }
        self.posPlayers = [allPlayers sortedArrayUsingSelector:@selector(compare:)];
    } else {
        self.posPlayers = [playerNames[5] sortedArrayUsingSelector:@selector(compare:)];
    }
    
    if (self.pos != 6) {
        _selectedPlayer = self.myRoster.players[self.pos];
    } else {
        _selectedTeam = self.myRoster.players[self.pos];
        // hide player stats elements & show team stats elements
        self.labelKills.text = @"Drags:";
        self.labelDeaths.text = @"Barons:";
        self.labelAssists.text = @"Wins:";
        self.labelCS.text = @"FBs:";
        self.segmentMultiSelector.hidden = YES;
        self.labelTriples.hidden = YES;
        self.labelQuadras.hidden = YES;
        self.labelPentas.hidden = YES;
        self.sliderMultiValue.hidden = YES;
        self.labelKDABonus.text = @"    Towers:";
        self.stepper.maximumValue = 44;
    }
    
    [self configureView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Player Picker Data Source Methods

- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == rosterComponent) {
        return 2;
    } else {
        return self.posPlayers.count;
    }
}

#pragma mark - Player Picker Delegate Methods

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == rosterComponent) {
        NSMutableArray *rosters = [[NSMutableArray alloc] init];
        [rosters addObject:(_myRoster.name)];
        [rosters addObject:(_oppRoster.name)];
        return rosters[row];
    } else {
        return self.posPlayers[row];
    }
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == rosterComponent && [self.playerPicker selectedRowInComponent:rosterComponent] == 0) {
        if (self.pos != 6) {
            _selectedPlayer = self.myRoster.players[self.pos];
        } else {
            _selectedTeam = self.myRoster.players[self.pos];
        }
        [self configureView];
    } else if (component == rosterComponent && [self.playerPicker selectedRowInComponent:rosterComponent] == 1) {
        if (self.pos != 6) {
            _selectedPlayer = self.oppRoster.players[self.pos];
        } else {
            _selectedTeam = self.oppRoster.players[self.pos];
        }
        [self configureView];
    }
}

- (IBAction)backgroundTap:(id)sender {
    [self.textKills resignFirstResponder];
    [self.textDeaths resignFirstResponder];
    [self.textAssists resignFirstResponder];
    [self.textCS resignFirstResponder];
}

- (IBAction)updatePressed:(UIButton *)sender {
    NSInteger selection = [self.playerPicker selectedRowInComponent:playerComponent];
    if (self.pos != 6) {
        _selectedPlayer.name = self.posPlayers[selection];
        _selectedPlayer.position = [_selectedPlayer getPosition];
        _selectedPlayer.kills = [self.textKills.text integerValue];
        _selectedPlayer.deaths = [self.textDeaths.text integerValue];
        _selectedPlayer.assists = [self.textAssists.text integerValue];
        _selectedPlayer.cs = [self.textCS.text integerValue];
        _selectedPlayer.triples = [self.labelTriples.text integerValue];
        _selectedPlayer.quadras = [self.labelQuadras.text integerValue];
        _selectedPlayer.pentas = [self.labelPentas.text integerValue];
        _selectedPlayer.bonuses = [self.labelBonuses.text integerValue];
        if ([self.playerPicker selectedRowInComponent:rosterComponent] == 0) {
            self.myRoster.players[self.pos] = _selectedPlayer;
        } else {
            self.oppRoster.players[self.pos] = _selectedPlayer;
        }
    } else {
        _selectedTeam.name = self.posPlayers[selection];
        // set team stats from fields to selected team
        _selectedTeam.drags = [self.textKills.text integerValue];
        _selectedTeam.barons = [self.textDeaths.text integerValue];
        _selectedTeam.wins = [self.textAssists.text integerValue];
        _selectedTeam.fbs = [self.textCS.text integerValue];
        _selectedTeam.towers = [self.labelBonuses.text integerValue];
        if ([self.playerPicker selectedRowInComponent:rosterComponent] == 0) {
            self.myRoster.players[self.pos] = _selectedTeam;
        } else {
            self.oppRoster.players[self.pos] = _selectedTeam;
        }
    }
}

- (IBAction)toggleMultis:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.labelTriples.hidden = NO;
        self.labelQuadras.hidden = YES;
        self.labelPentas.hidden = YES;
        self.sliderMultiValue.value = [self.labelTriples.text integerValue];
    } else if (sender.selectedSegmentIndex == 1) {
        self.labelTriples.hidden = YES;
        self.labelQuadras.hidden = NO;
        self.labelPentas.hidden = YES;
        self.sliderMultiValue.value = [self.labelQuadras.text integerValue];
    } else {
        self.labelTriples.hidden = YES;
        self.labelQuadras.hidden = YES;
        self.labelPentas.hidden = NO;
        self.sliderMultiValue.value = [self.labelPentas.text integerValue];
    }
}

- (IBAction)sliderChanged:(UISlider *)sender {
    int sliderValue = lround(sender.value);
    if (self.segmentMultiSelector.selectedSegmentIndex  == 0) {
        self.labelTriples.text = [NSString stringWithFormat:@"%d",sliderValue];
    } else if (self.segmentMultiSelector.selectedSegmentIndex == 1) {
        self.labelQuadras.text = [NSString stringWithFormat:@"%d",sliderValue];
    } else {
        self.labelPentas.text = [NSString stringWithFormat:@"%d",sliderValue];
    }
}

- (IBAction)valueChanged:(UIStepper *)sender {
    double value = [sender value];
    [self.labelBonuses setText: [NSString stringWithFormat:@"%d", (int)value]];
}
@end
