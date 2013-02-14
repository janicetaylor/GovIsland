//
//  HistoryViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HistoryViewController.h"


@implementation HistoryViewController
@synthesize myTourTable, myArray, myxmlArray, backBtn, myAnnotationTypeArray; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [backBtn release];
    [myAnnotationTypeArray release];
    [myxmlArray release];
    [myArray release]; 
    [myTourTable release]; 
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
    
    // Load xml file    
    tbxml = [[TBXML tbxmlWithXMLFile:myXML] retain];
    
    // Obtain root element
	TBXMLElement *root = tbxml.rootXMLElement;
    
    // if root element is valid
	if(root) {
        // search for the first location element within the root element's children
		TBXMLElement *location = [TBXML childElementNamed:@"location" parentElement:root];
        // NSString *tempClass = [TBXML valueOfAttributeNamed:@"annotationType" forElement:root];
        
        // NSLog(@"annotation type is: %@", tempClass);
        
        // if location element was found
		while (location != nil) {
            
            NSString *name = [TBXML valueOfAttributeNamed:@"name" forElement:location];
            [myArray addObject:name];
            
            NSString *detailxml = [TBXML valueOfAttributeNamed:@"detailxml" forElement:location];
            [myxmlArray addObject:detailxml]; 
            
            NSString *tempAnnotation = [TBXML valueOfAttributeNamed:@"annotationType" forElement:location];
            [myAnnotationTypeArray addObject:tempAnnotation]; 
            
            // move onto next location in xml file 
            location = [TBXML nextSiblingNamed:@"location" searchFromElement:location];
            
        } // end location while loop
        
        // NSLog(@"myArray is: %@", myArray);
        // NSLog(@"myxmlArray is: %@", myxmlArray);
        NSLog(@"myAnnotationTypeArray is: %@", myAnnotationTypeArray);
        
    } // end if(root) 
    
    // release resources
	[tbxml release];
    
}


- (void)viewDidLoad {
    // Alloc array  
    myArray = [[NSMutableArray alloc] init];
    myxmlArray = [[NSMutableArray alloc] init];
    myAnnotationTypeArray = [[NSMutableArray alloc] init];
    
    [self loadXML:@"tour.xml"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    myArray = nil; 
    myTourTable = nil;  
    myxmlArray = nil; 
    myAnnotationTypeArray = nil; 
    
    // self.myTourTable = nil; 
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
#ifndef __IPHONE_3_0
- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDisclosureIndicator;
}
#endif
*/



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"clicked: indexPath.row is %i", indexPath.row );
    NSLog(@"my item is: %@", [myArray objectAtIndex:indexPath.row]);
    // NSLog(@"my xml file is: %@", [myxmlArray objectAtIndex:indexPath.row]);

    // pass xml file to TourSecondaryViewController 
    secondaryXML = [myxmlArray objectAtIndex:indexPath.row]; 
    myTitle = [myArray objectAtIndex:indexPath.row];
    myAnnotationType = [myAnnotationTypeArray objectAtIndex:indexPath.row];
   // NSLog(@"secondaryXML is: %@", secondaryXML);
    
   // NSLog(@" myAnnotationType: %@", myAnnotationType );
    
   [self goToSecondaryView];
}


-(void)goToSecondaryView {
    NSLog(@"go to secondary view");

    TourSecondaryViewController *toursecViewController = [[TourSecondaryViewController alloc] initWithNibName:@"TourSecondaryViewController" bundle:nil];
    
    toursecViewController.xmltoLoad = secondaryXML;
    toursecViewController.myNavBarTitle = myTitle;
    toursecViewController.myAnnotationType = myAnnotationType; 
    [self.view addSubview:toursecViewController.view];
    
}


@end
