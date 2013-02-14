//
//  MapDetailViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 4/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h> 

#import "SecondViewController.h"
#import "ArmyBuildingLocation.h" 

@interface MapDetailViewController : UIViewController <UIWebViewDelegate> {
    UIWebView *webView;
    UIBarButtonItem *backBtn;
    UINavigationBar *navBar;
    NSString *myURLStr; // get this from SecondViewController
    NSString *myNavBarTitle; // get this from SecondViewController
    MKAnnotationView *myAnnotation;
    NSString *myAnnotationType;             // Type of Annotation
    NSNumber *annotationID;     // Annotation ID 


}

@property (nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic,retain) IBOutlet UINavigationBar *navBar;


@property (copy) NSNumber *annotationID;
@property (copy) NSString *myAnnotationType;
@property (copy) NSString *myURLStr;
@property (copy) NSString *myNavBarTitle;
@property (nonatomic, retain) MKAnnotationView *myAnnotation;


-(IBAction)goToTourMap:(id)sender; 

@end
