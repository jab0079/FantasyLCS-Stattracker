//
//  lcsLeagueViewController.m
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsLeagueViewController.h"
#import "lcsPlayerPickerViewController.h"
#import "lcsPlayerPositionCell.h"
#import "lcsRoster.h"
#import "lcsPlayer.h"
#import "lcsTeam.h"


@interface lcsLeagueViewController ()
- (void)configureView;
@end

@implementation lcsLeagueViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    UITableView *view = (UITableView *)self.view;
    [view reloadData];
    [self configureView];
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.labelMyTeam.text = [[self.detailItem objectForKey:@"myTeam"] name];
        self.labelOppTeam.text = [[self.detailItem objectForKey:@"oppTeam"] name];
        
        lcsRoster *myRoster = [self.detailItem objectForKey:@"myTeam"];
        lcsRoster *oppRoster = [self.detailItem objectForKey:@"oppTeam"];
        
        self.labelMyScore.text = [NSString stringWithFormat:@"%.2f", [myRoster calcScore]];
        self.labelOppScore.text = [NSString stringWithFormat:@"%.2f", [oppRoster calcScore]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @" ";
    
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    lcsRoster *roster = [self.detailItem objectForKey:@"myTeam"];
    return roster.players.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *PositionCellID = @"PositionPlayerCell";
    
    lcsPlayerPositionCell  *cell = [tableView dequeueReusableCellWithIdentifier:PositionCellID];

        lcsRoster *myRoster = [self.detailItem objectForKey:@"myTeam"];
        lcsRoster *oppRoster = [self.detailItem objectForKey:@"oppTeam"];
        
        if (indexPath.row != 6) {
            lcsPlayer *myPlayer = myRoster.players[indexPath.row];
            lcsPlayer *oppPlayer = oppRoster.players[indexPath.row];
            
            cell.labelMyPlayer.text = myPlayer.name;
            cell.labelOppPlayer.text = oppPlayer.name;
            cell.labelPosition.text = myPlayer.position;
            cell.labelMyPlayerScore.text = [NSString stringWithFormat:@"%.2f", [myPlayer getScore]];
            cell.labelOppPlayerScore.text = [NSString stringWithFormat:@"%.2f", [oppPlayer getScore]];
        } else {
            lcsTeam *myTeam = myRoster.players[indexPath.row];
            lcsTeam *oppTeam = oppRoster.players[indexPath.row];
            
            cell.labelMyPlayer.text = myTeam.name;
            cell.labelOppPlayer.text = oppTeam.name;
            cell.labelPosition.text = @"TEAM";
            cell.labelMyPlayerScore.text = [NSString stringWithFormat:@"%.2f", [myTeam getScore]];
            cell.labelOppPlayerScore.text = [NSString stringWithFormat:@"%.2f", [oppTeam getScore]];
        }
    
    cell.tag = indexPath.row;
    
 return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showPlayerPicker"]) {
        lcsPlayerPickerViewController *playerPickerViewController = [segue destinationViewController];
        
        NSIndexPath *posSelected = [self.tableView indexPathForCell:sender];
        NSInteger position = [posSelected row];
        lcsRoster *myRoster = [self.detailItem objectForKey:@"myTeam"];
        lcsRoster *oppRoster = [self.detailItem objectForKey:@"oppTeam"];
        
        playerPickerViewController.pos = position;
        playerPickerViewController.myRoster = myRoster;
        playerPickerViewController.oppRoster = oppRoster;
    }
}

@end
