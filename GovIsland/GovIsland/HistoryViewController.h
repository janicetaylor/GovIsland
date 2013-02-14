//
//  HistoryViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Tour on the navbar

#import "TBXML.h"
#import "TourSecondaryViewController.h"
#import "GovIslandAppDelegate.h"
#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController {
    IBOutlet UITableView *myTourTable;
    NSMutableArray *myArray; 
    NSMutableArray *myxmlArray; 
    NSMutableArray *myAnnotationTypeArray; 
    NSString *myTitle; // title for the next tableview
    NSString *secondaryXML; // xml file to load for secondary tour view controller
    NSString *myAnnotationType; // annotation type for next tableview
    TBXML *tbxml;
    
}

@property (nonatomic, retain) NSMutableArray *myArray;
@property (nonatomic, retain) NSMutableArray *myxmlArray;
@property (nonatomic, retain) NSMutableArray *myAnnotationTypeArray;
@property (nonatomic, retain) IBOutlet UITableView *myTourTable;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *backBtn;


-(void)loadXML:(NSString*)myXML;
-(void)goToSecondaryView;

@end
