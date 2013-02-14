//
//  AboutViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"
@implementation AboutViewController
@synthesize myAboutTable, myArray, myurlArray; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [myAboutTable release];
    [myArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)loadXML:(NSString*)myXML {
    
    // Load map.xml file    
    //  tbxml = [[TBXML tbxmlWithXMLFile:@"armyBuildings.xml"] retain];
    tbxml = [[TBXML tbxmlWithXMLFile:myXML] retain];
    
    // Obtain root element
	TBXMLElement *root = tbxml.rootXMLElement;
    
    
    // if root element is valid
	if(root) {
        // search for the first location element within the root element's children
		TBXMLElement *location = [TBXML childElementNamed:@"location" parentElement:root];
        // NSString *tempClass = [TBXML valueOfAttributeNamed:@"annotationType" forElement:root];
        
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Alloc array  
    myArray = [[NSMutableArray alloc] init];
    myurlArray = [[NSMutableArray alloc] init];
    
    // Load XML
    [self loadXML:@"visitorInfo.xml"];
    
    // Load from XML 
  
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.myArray = nil;
    self.myurlArray = nil;

    self.myAboutTable = nil;
    
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

#ifndef __IPHONE_3_0
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}
#endif


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSLog(@"clicked: indexPath.row is %i", indexPath.row );
    
    // get url based on what object i clicked on 
    myURL = [myurlArray objectAtIndex:[indexPath row]]; 
    myTitle = [myArray objectAtIndex:[indexPath row]]; 
    
     NSLog(@"myURL: %@. myTitle: %@", myURL, myTitle); 
    [self goToWebView];
    
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

-(void)goToWebView {
    NSLog(@"go to web view");
    VisitorInfoWebViewController *webViewController = [[VisitorInfoWebViewController alloc] initWithNibName:@"VisitorInfoWebViewController" bundle:nil];
    
    webViewController.myURLStr = myURL;
    webViewController.myNavBarTitle = myTitle;
    
    [self.view addSubview:webViewController.view];
    
    
}


@end
