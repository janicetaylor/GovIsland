//
//  FirstViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeDetailViewController.h"

@interface FirstViewController : UIViewController {
    UIWebView *webView;
    UINavigationBar *navBar;
    
}

@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic,retain) IBOutlet UINavigationBar *navBar;

-(IBAction)goToSectionOne:(id)sender;
-(IBAction)goToSectionTwo:(id)sender;
-(IBAction)goToSectionThree:(id)sender;
-(IBAction)goToSectionFour:(id)sender;


@end
