//
//  HomeDetailViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 5/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h" 

@interface HomeDetailViewController : UIViewController {
    UIWebView *webView;
    NSString *myURLStr;
    NSString *myTitleStr; 
    UIBarButtonItem *backBtn; 
    UINavigationBar *navBar;

}

@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic,retain) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic,retain) IBOutlet UINavigationBar *navBar;

@property (copy) NSString *myURLStr;
@property (copy) NSString *myTitleStr;


-(IBAction)goToMainView:(id)sender;


@end
