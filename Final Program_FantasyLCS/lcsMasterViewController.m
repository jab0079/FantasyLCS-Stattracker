//
//  lcsMasterViewController.m
//  Final Program_FantasyLCS
//
//  Created by Jared Brown on 7/20/14.
//  Copyright (c) 2014 Jared Brown. All rights reserved.
//

#import "lcsMasterViewController.h"
#import "lcsLeagueViewController.h"
#import "lcsRoster.h"
#import "lcsTeam.h"
#import "lcsPlayer.h"

@interface lcsMasterViewController () {
    NSMutableArray *_leagues;
    NSInteger _count;
}
@end

@implementation lcsMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_leagues) {
        _leagues = [[NSMutableArray alloc] init];
        _count = 0;
    }
    // Initialize a league
    NSMutableDictionary *myLeague = [[NSMutableDictionary alloc] init];
    NSString *leagueName = [NSString stringWithFormat:@"League #%d",++_count];
    [myLeague setObject:leagueName forKey:@"leagueName"];
    // Initialize the empty teams
    lcsRoster *myTeam = [[lcsRoster alloc] init];
    myTeam.name = @"My Team";
    [myLeague setObject:myTeam forKey:@"myTeam"];
    lcsRoster *oppTeam = [[lcsRoster alloc] init];
    oppTeam.name = @"Opponent";
    [myLeague setObject:oppTeam forKey:@"oppTeam"];
    
    [_leagues insertObject:myLeague atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self performSegueWithIdentifier:@"showLeague" sender:self];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _leagues.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSMutableDictionary *league = _leagues[indexPath.row];
    cell.textLabel.text = [league objectForKey:@"leagueName"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_leagues removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showLeague"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableDictionary *league = _leagues[indexPath.row];
        [[segue destinationViewController] setDetailItem:league];
    }
}

@end
