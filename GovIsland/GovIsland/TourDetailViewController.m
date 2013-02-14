//
//  TourDetailViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TourDetailViewController.h"


@implementation TourDetailViewController
@synthesize webView, backBtn, myURLStr, myNavBarTitle, navBar, myxmltoLoad, myDetailNavTitle, tourBtn, myAnnotationToSelect, myAnnotationID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [myAnnotationID release];
    [myAnnotationToSelect release];
    [myDetailNavTitle release];
    [myxmltoLoad release];
    [navBar release]; 
    [backBtn release];
    [webView release]; 
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)gotoMap:(id)sender {
    NSLog(@"go to map");
        
    GovIslandAppDelegate *appDelegate = (GovIslandAppDelegate*) [[UIApplication sharedApplication] delegate];
    [appDelegate switchToTab:1 selectAnnotation:myAnnotationID withAnnotationType:myAnnotationToSelect];
    
    


    
}

-(IBAction)goToSecondaryView:(id)sender { 
    NSLog(@"go back to secondary view");
    
    // Remove this view 
    [self.view removeFromSuperview];
    
    // Load main view
    TourSecondaryViewController *tsViewController = [[TourSecondaryViewController alloc] initWithNibName:@"TourSecondaryViewController" bundle:nil];
    NSLog(@"tsViewController.xmltoLoad is: %@", tsViewController.xmltoLoad);
    NSLog(@"my xmltoLoad is: %@", myxmltoLoad);
    NSLog(@"myDetailNavTitle is: %@", myDetailNavTitle);

    tsViewController.xmltoLoad = myxmltoLoad;
    tsViewController.myNavBarTitle = myDetailNavTitle; 

    [self.view addSubview:tsViewController.view];
}


- (void)viewDidLoad {
    
    // Change navigation title 
    NSLog(@"at viewDidLoad. myURLStr is: %@. myNavBarTitle is: %@", myURLStr, myNavBarTitle);
    navBar.topItem.title = myNavBarTitle;
    
    
    // Load url from local filepath 
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:myURLStr ofType:@"html"]isDirectory:NO]];
	
	//Load the request in the UIWebView.
	[webView setHidden:NO];
	[webView loadRequest:requestObj];	
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload {
    self.webView = nil; 
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end