//
//  FirstViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"


@implementation FirstViewController
@synthesize webView, navBar;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 
- (void)viewDidLoad {
    NSLog(@"view did load");
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //Your code here
    NSLog(@"View will appear");
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

-(IBAction)goToSectionOne:(id)sender {  
    
    HomeDetailViewController *hdViewController = [[HomeDetailViewController alloc] initWithNibName:@"HomeDetailViewController" bundle:nil];
    
    hdViewController.myTitleStr = @"Overview"; 
    hdViewController.myURLStr = @"section1";
    [self.view addSubview:hdViewController.view];

}

-(IBAction)goToSectionTwo:(id)sender {  
    HomeDetailViewController *hdViewController = [[HomeDetailViewController alloc] initWithNibName:@"HomeDetailViewController" bundle:nil];
    
    hdViewController.myTitleStr = @"About Governors Island"; 
    hdViewController.myURLStr = @"section2";
    [self.view addSubview:hdViewController.view];
    
}

-(IBAction)goToSectionThree:(id)sender {  
    HomeDetailViewController *hdViewController = [[HomeDetailViewController alloc] initWithNibName:@"HomeDetailViewController" bundle:nil];
    
    hdViewController.myTitleStr = @"About the Guide"; 
    hdViewController.myURLStr = @"section3";
    [self.view addSubview:hdViewController.view];
}

-(IBAction)goToSectionFour:(id)sender {  
    HomeDetailViewController *hdViewController = [[HomeDetailViewController alloc] initWithNibName:@"HomeDetailViewController" bundle:nil];
    
    hdViewController.myTitleStr = @"Contact Us"; 
    hdViewController.myURLStr = @"section4";
    [self.view addSubview:hdViewController.view];
}


- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.webView = nil; 

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [webView release];
    [super dealloc];
}

@end
