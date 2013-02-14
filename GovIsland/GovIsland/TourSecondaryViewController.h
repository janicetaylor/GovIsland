//
//  TourSecondaryViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 4/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBXML.h"
#import "HistoryViewController.h"
#import "TourDetailViewController.h"

@interface TourSecondaryViewController : UIViewController {
    TBXML *tbxml;
    NSMutableArray *myArray; 
    NSMutableArray *myurlArray; 
    IBOutlet UITableView *mySecondaryTourTable;
    NSString *xmltoLoad; // get this from HistoryViewController
    NSString *myNavBarTitle; // get this from HistoryViewController
    NSString *myAnnotationType; // get this from HistoryViewController

    UIBarButtonItem *backBtn;
    UINavigationBar *navBar;
    
    
    
}

@property (nonatomic, retain) IBOutlet UITableView *mySecondaryTourTable;
@property (nonatomic, retain) NSMutableArray *myArray;
@property (nonatomic, retain) NSMutableArray *myurlArray;
@property (nonatomic,retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backBtn;


@property (copy) NSString *xmltoLoad;
@property (copy) NSString *myNavBarTitle;
@property (copy) NSString *myAnnotationType;


-(void)loadXML:(NSString*)myXML; 
-(IBAction)goToMain:(id)sender;

@end
