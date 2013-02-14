//
//  FilterViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FilterViewController.h"

@implementation FilterViewController
@synthesize backBtn; 
@synthesize myArray, myFilterTable; 


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [myFilterTable release];
    [myArray release]; 
    [backBtn release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Load arrays for table 
    NSArray *array = [[NSArray alloc] initWithObjects:@"Army Buildings", @"Army Homes", @"Landmarks", @"Open Spaces", @"Points of Interest", @"Recreation", @"Food and Drink", @"Restrooms", nil];
    self.myArray = array; 
       
    [array release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.myArray = nil;
    self.myFilterTable = nil; 
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)goToMap:(id)sender {
    NSLog(@"go to tour map");
    
    // Load map view
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:nil];
    [self.view addSubview:secondViewController.view];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // #warning Incomplete method implementation.
    // Return the number of rows in the section.
    // return 0;
    return [self.myArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // Add switches to table 
        switchView = [[[UISwitch alloc] initWithFrame:CGRectZero] autorelease];
        cell.accessoryView = switchView;
        switchView.tag = [indexPath row]; 
        [switchView addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
     
    }
    
    else {
        switchView = (UISwitch *)cell.accessoryView;
    }
    
    // Populate the table 
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [myArray objectAtIndex:row];


    // set from user defaults
    myMapData = [[MapData alloc] init];	
    
    if(switchView.tag == 0) { 
        switchView.on = [myMapData loadArmyBuildings];
    }
    
    if(switchView.tag == 1) {
        switchView.on = [myMapData loadArmyHomes];
    }
    
    if(switchView.tag == 2) {
        switchView.on = [myMapData loadLandmarks];
    }
    
    if(switchView.tag == 3) {
        switchView.on = [myMapData loadOpenSpaces];
    }
    
    if(switchView.tag == 4) {
        switchView.on = [myMapData loadPointsofInterest];
    }
    
    if(switchView.tag == 5) {
        switchView.on = [myMapData loadRecreation];
    }
    
    if(switchView.tag == 6) {
        switchView.on = [myMapData loadFood];
    }
    
    if(switchView.tag == 7) {
        switchView.on = [myMapData loadRestrooms];
    }
        
    [myMapData release]; 
        
    return cell;
}



- (void)switchChanged:(id)sender {
    UISwitch *switchControl = sender;
    NSLog( @"The switch is %@. Switched I clicked on is %i", switchControl.on ? @"ON" : @"OFF", switchControl.tag );
        
    // army buildings 
    if(switchControl.tag == 0) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveArmyBuildings:switchControl.on];
        [myMapData release]; 
    }
    
    // army homes
    if(switchControl.tag == 1) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveArmyHomes:switchControl.on];
        [myMapData release]; 
    }
    
    // landmarks 
    if(switchControl.tag == 2) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveLandmarks:switchControl.on];
        [myMapData release]; 
    }
    
    // open spaces
    if(switchControl.tag == 3) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveOpenSpaces:switchControl.on];
        [myMapData release]; 
    }
    
    // points of interest
    if(switchControl.tag == 4) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData savePointsofInterest:switchControl.on];
        [myMapData release]; 
    }
    
    // recreation
    if(switchControl.tag == 5) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveRecreation:switchControl.on];
        [myMapData release]; 
    }
    
    // food
    if(switchControl.tag == 6) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveFood:switchControl.on];
        [myMapData release]; 
    }
    
    // restrooms
    if(switchControl.tag == 7) {
        // Save out to MapData
        myMapData = [[MapData alloc] init];	
        [myMapData saveRestrooms:switchControl.on];
        [myMapData release]; 
    }
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}



@end
