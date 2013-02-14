//
//  VisitorInfoViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// History on the navbar


#import <UIKit/UIKit.h>
#import "TBXML.h"
#import "HistoryDetailViewController.h"

@interface VisitorInfoViewController : UIViewController {
    IBOutlet UITableView *myHistoryTable;
    NSMutableArray *myArray; 
    NSMutableArray *myurlArray; 
    NSString *myURL; // url string that i'm on 
    NSString *myTitle; // title for the detail webview
    TBXML *tbxml;
}

@property (nonatomic, retain) NSMutableArray *myArray;
@property (nonatomic, retain) NSMutableArray *myurlArray;
@property (nonatomic, retain) IBOutlet UITableView *myHistoryTable;

-(void)loadXML:(NSString*)myXML;
-(void)goToWebView; 

@end