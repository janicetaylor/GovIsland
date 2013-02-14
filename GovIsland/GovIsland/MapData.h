//
//  MapData.h
//  GovIsland
//
//  Created by Janice Garingo on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

// Handles what annotation points to show/hide

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MapData : NSObject {
    NSUserDefaults *userPreferences;     
}


-(int)loadArmyBuildings; 
-(id)saveArmyBuildings:(int)isArmyBuildings; 

-(int)loadArmyHomes; 
-(id)saveArmyHomes:(int)isArmyHomes; 

-(int)loadLandmarks; 
-(id)saveLandmarks:(int)isLandmarks; 

-(int)loadOpenSpaces; 
-(id)saveOpenSpaces:(int)isOpenSpaces; 

-(int)loadPointsofInterest; 
-(id)savePointsofInterest:(int)isInterest; 

-(int)loadRecreation; 
-(id)saveRecreation:(int)isRecreation; 

-(int)loadFood; 
-(id)saveFood:(int)isFood; 

-(int)loadRestrooms; 
-(id)saveRestrooms:(int)isRestrooms; 

-(BOOL)loadFirstTime; 
-(void)saveFirstTime:(BOOL)preference;

@end
