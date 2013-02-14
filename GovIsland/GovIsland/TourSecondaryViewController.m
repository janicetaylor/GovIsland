//
//  TourSecondaryViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TourSecondaryViewController.h"


@implementation TourSecondaryViewController
@synthesize mySecondaryTourTable, myArray, xmltoLoad, navBar, backBtn, myNavBarTitle, myurlArray, myAnnotationType; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [myAnnotationType release];
    [myurlArray release];
    [myNavBarTitle release];
    [mySecondaryTourTable release];
    [myArray release];
    [xmltoLoad release];
    [backBtn release]; 
    [navBar release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)goToMain:(id)sender { 
    // NSLog(@"go back to main view");
    
    // Remove this view 
    [self.view removeFromSuperview];
    
    // Load main view
    HistoryViewController *historyViewController = [[HistoryViewController alloc] initWithNibName:@"HistoryViewController" bundle:nil];
    [self.view addSubview:historyViewController.view];
}

-(void)loadXML:(NSString*)myXML {
    
    // Load map.xml file    
    tbxml = [[TBXML tbxmlWithXMLFile:myXML] retain];
    
    // Obtain root element
	TBXMLElement *root = tbxml.rootXMLElement;
    
    
    // if root element is valid
	if(root) {
        // search for the first location element within the root element's children
		TBXMLElement *location = [TBXML childElementNamed:@"location" parentElement:root];
        
        // NSLog(@"annotation type is: %@", tempClass);
        
        // get annotation type from XML file 
        
        // if location element was found
		while (location != nil) {
            
            NSString *name = [TBXML valueOfAttributeNamed:@"name" forElement:location];
            NSString *url = [TBXML valueOfAttributeNamed:@"url" forElement:location];
            
            [myArray addObject:name];
            [myurlArray addObject:url];
            
            // move onto next location in xml file 
            location = [TBXML nextSiblingNamed:@"location" searchFromElement:location];
            
        } // end location while loop
        
       // NSLog(@"myArray is: %@", myArray);
       // NSLog(@"myurlArray is: %@", myurlArray);
     
        
        
    } // end if(root) 
    
    // release resources
	[tbxml release];
    
}

- (void)viewDidLoad {
    
   // NSLog(@"at viewDidLoad. xmltoLoad is: %@", xmltoLoad);
    
    // Alloc array 
    myArray = [[NSMutableArray alloc] init];
    myurlArray = [[NSMutableArray alloc] init];
    
    // load xml from HistoryViewController 
    [self loadXML:xmltoLoad];
    
    // Change navigation title 
   //  NSLog(@"at viewDidLoad. myURLStr is: %@. myNavBarTitle is: %@", myURLStr, myNavBarTitle);
    navBar.topItem.title = myNavBarTitle;
    
    [super viewDidLoad];
    
    NSLog(@"myAnnotationType: %@", myAnnotationType);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload {
    
    myArray = nil;
    myurlArray = nil; 
    mySecondaryTourTable = nil;
    
    // self.mySecondaryTourTable = nil; 
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
    }
    
    // Configure the cell...
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [myArray objectAtIndex:row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    // NSLog(@"row is: %i", row);
    // NSLog(@"my item is: %@", [myArray objectAtIndex:row]);
    
    return cell;
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

/* 
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"clicked: indexPath.row is %i", indexPath.row );
    NSLog(@"my item is: %@", [myArray objectAtIndex:indexPath.row]);
    NSLog(@"my url file is: %@", [myurlArray objectAtIndex:indexPath.row]);
    
    // NSLog(@"clicked: indexPath.row is %i", indexPath.row );
    
    TourDetailViewController *tdViewController = [[TourDetailViewController alloc] initWithNibName:@"TourDetailViewController" bundle:nil];
    
    NSNumber *rowNumber = [NSNumber numberWithInteger:indexPath.row];

    
    tdViewController.myURLStr = [myurlArray objectAtIndex:indexPath.row];
    tdViewController.myNavBarTitle = [myArray objectAtIndex:indexPath.row];
    tdViewController.myxmltoLoad = xmltoLoad;
    tdViewController.myDetailNavTitle = myNavBarTitle; 
    tdViewController.myAnnotationToSelect = myAnnotationType;
    tdViewController.myAnnotationID = rowNumber;
    
    [self.view addSubview:tdViewController.view];
   

    
}


@end
