//
//  TourDetailViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TourSecondaryViewController.h"
#import "SecondViewController.h"
#import "GovIslandAppDelegate.h" 

@interface TourDetailViewController : UIViewController {
    UIWebView *webView;
    UIBarButtonItem *backBtn; 
    UIBarButtonItem *tourBtn; 
    NSString *myURLStr; // get this from TourSecondaryViewController
    NSString *myNavBarTitle; // get this from TourSecondaryViewController
    UINavigationBar *navBar;
    NSString *myxmltoLoad;     // from TourSecondaryViewController, xml to feed TourSecondaryViewController when you hit back button
    NSString *myDetailNavTitle;  // title for navbar for TourSecondaryViewController when you hit back button
    NSString *myAnnotationToSelect;
    NSNumber *myAnnotationID; 

}

@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *tourBtn;
@property (nonatomic,retain) IBOutlet UINavigationBar *navBar;

@property (copy) NSString *myURLStr;
@property (copy) NSString *myNavBarTitle;
@property (copy) NSString *myxmltoLoad;
@property (copy) NSString *myDetailNavTitle;
@property (copy) NSString *myAnnotationToSelect;
@property (copy) NSNumber *myAnnotationID;


-(IBAction)goToSecondaryView:(id)sender;

@end
