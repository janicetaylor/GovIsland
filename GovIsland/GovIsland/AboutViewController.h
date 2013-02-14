//
//  AboutViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// VisitorInfo on the navbar

#import <UIKit/UIKit.h>
#import "TBXML.h"
#import "VisitorInfoWebViewController.h"

@interface AboutViewController : UIViewController {
    IBOutlet UITableView *myAboutTable;
    NSMutableArray *myArray; 
    NSMutableArray *myurlArray; 
    NSString *myURL; // url string that i'm on 
    NSString *myTitle; // title for the detail webview
    TBXML *tbxml;
}

@property (nonatomic, retain) NSMutableArray *myArray;
@property (nonatomic, retain) NSMutableArray *myurlArray;
@property (nonatomic, retain) IBOutlet UITableView *myAboutTable;

-(void)loadXML:(NSString*)myXML;
-(void)goToWebView; 

@end
