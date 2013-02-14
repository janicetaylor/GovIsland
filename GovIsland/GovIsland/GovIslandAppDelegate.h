//
//  GovIslandAppDelegate.h
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface GovIslandAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

-(void)switchToTab:(int)myIndex selectAnnotation:myAnnotationID withAnnotationType:myAnnotationToSelect;

@end
