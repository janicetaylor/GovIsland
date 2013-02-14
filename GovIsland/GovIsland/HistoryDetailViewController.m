//
//  HistoryDetailViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HistoryDetailViewController.h"


@implementation HistoryDetailViewController
@synthesize webView, backBtn, myURLStr, myNavBarTitle, navBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc {
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

-(IBAction)goToMain:(id)sender { 
    NSLog(@"go back to main view");
    
    // Remove this view 
    [self.view removeFromSuperview];
    
    // Load main view
    VisitorInfoViewController *vinfoViewController = [[VisitorInfoViewController alloc] initWithNibName:@"VisitorInfoViewController" bundle:nil];
    [self.view addSubview:vinfoViewController.view];
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
