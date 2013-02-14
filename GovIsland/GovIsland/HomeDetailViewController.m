//
//  HomeDetailViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HomeDetailViewController.h"

@implementation HomeDetailViewController
@synthesize webView, myURLStr, backBtn, navBar, myTitleStr; 


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
    [myTitleStr release];
    [backBtn release];
    [myURLStr release]; 
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

-(IBAction)goToMainView:(id)sender { 
    NSLog(@"go back to main view");
    
    // Remove this view 
    [self.view removeFromSuperview];
    
    // Load main view
    FirstViewController *firstViewController = [[FirstViewController alloc] initWithNibName:@"FirstView" bundle:nil];
    [self.view addSubview:firstViewController.view];
}

- (void)viewDidLoad {
    
    navBar.topItem.title = myTitleStr;
    
    // Load url from local filepath 
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:myURLStr ofType:@"html"]isDirectory:NO]];
    
    //Load the request in the UIWebView.
	[webView setHidden:NO];
	[webView loadRequest:requestObj];	
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
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
