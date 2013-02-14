//
//  FilterViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "MapData.h" 

@interface FilterViewController : UIViewController {
    UIBarButtonItem *backBtn; // back to map
    
    IBOutlet UITableView *myFilterTable;
    NSArray *myArray; 
    MapData *myMapData; 
    UISwitch *switchView;
}

@property (nonatomic, retain) IBOutlet UIBarButtonItem *backBtn;
@property (nonatomic, retain) IBOutlet UITableView *myFilterTable;
@property (nonatomic, retain) NSArray *myArray;


-(IBAction)goToMap:(id)sender; 

@end
