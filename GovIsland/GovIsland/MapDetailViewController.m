//
//  MapDetailViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 4/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapDetailViewController.h"


@implementation MapDetailViewController
@synthesize webView, backBtn, navBar, myURLStr, myNavBarTitle, myAnnotation, annotationID, myAnnotationType; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(IBAction)goToTourMap:(id)sender {
    NSLog(@"go to tour map");
    
    // Hide web view and navbar 
    [webView setHidden:YES];
    [navBar setHidden:YES];
    
    // Load map view
    SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondView" bundle:nil];
    [self.view addSubview:secondViewController.view];
         
    // Select point I just clicked on 
    [secondViewController selectAnnotation:annotationID withAnnotationType:myAnnotationType];	
    // [secondViewController release];
}


- (void)viewDidLoad {
    myAnnotation = [[MKAnnotationView alloc] init]; 
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Navigation bar
    [navBar setHidden:NO];

    
    // NSLog(@"MapDetailViewController: at viewDidLoad. myURLStr is: %@. myAnnotation is: %@", myURLStr, myAnnotation);
    NSLog(@"MapDetailViewController: annotationID: %@, myAnnotationType: %@", annotationID, myAnnotationType);

    
    navBar.topItem.title = myNavBarTitle;
    
    // Init WebView 
    webView.delegate = self;
		
	// Load url from local filepath 
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:myURLStr ofType:@"html"]isDirectory:NO]];

	
	//Load the request in the UIWebView.
	[webView setHidden:NO];
	[webView loadRequest:requestObj];	
	
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)showWebView {
	[webView setHidden:NO];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.webView = nil;
}

- (void)dealloc {
    [myAnnotation release];
	[webView release];
    [backBtn release]; 
    [navBar release]; 
    [myURLStr release]; 
    [myNavBarTitle release]; 
    [super dealloc];
}



@end
