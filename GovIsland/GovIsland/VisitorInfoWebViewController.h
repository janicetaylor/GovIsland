//
//  VisitorInfoWebViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutViewController.h"

@interface VisitorInfoWebViewController : UIViewController {
    UIWebView *webView;
    UIBarButtonItem *backBtn; 
    NSString *myURLStr; // get this from AboutViewController
    NSString *myNavBarTitle; // get this from AboutViewController
    UINavigationBar *navBar;
}

@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic,retain) IBOutlet UINavigationBar *navBar;


@property (copy) NSString *myURLStr;
@property (copy) NSString *myNavBarTitle;

-(IBAction)goToMain:(id)sender;


@end
