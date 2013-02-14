//
//  MapData.m
//  GovIsland
//
//  Created by Janice Garingo on 5/5/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapData.h"


@implementation MapData


// is first time


-(BOOL)loadFirstTime{
	userPreferences = [NSUserDefaults standardUserDefaults];
	NSNumber *firstTime = [userPreferences objectForKey:@"isFirstTime"];
	if(firstTime == nil){
		return NO;
	}
	else{
		return [firstTime boolValue];
	}
}

-(void)saveFirstTime:(BOOL)preference {
	NSNumber *pref = [NSNumber numberWithBool:preference];
	userPreferences = [NSUserDefaults standardUserDefaults];
	[userPreferences setObject:pref forKey:@"isFirstTime"];
	[userPreferences synchronize];
}

// Restrooms
-(int)loadRestrooms {
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isRestrooms = [userPreferences integerForKey:@"restrooms"];		
	NSLog(@"MapData: at restrooms : %i", isRestrooms ); 
	return isRestrooms; 	
}

-(id)saveRestrooms:(int)isRestrooms {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isRestrooms forKey:@"restrooms"];			
        NSLog(@"MapData: at restrooms: %i", isRestrooms ); 
	}
	return self;
}


// Food
-(int)loadFood {
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isFood = [userPreferences integerForKey:@"food"];		
	NSLog(@"MapData: at food : %i", isFood ); 
	return isFood; 	
}

-(id)saveFood:(int)isFood {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isFood forKey:@"food"];			
        NSLog(@"MapData: at food : %i", isFood ); 
	}
	return self;
}


// Recreation
-(int)loadRecreation {
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isRecreation = [userPreferences integerForKey:@"recreation"];		
	NSLog(@"MapData: at recreation : %i", isRecreation ); 
	return isRecreation; 	
}

-(id)saveRecreation:(int)isRecreation {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isRecreation forKey:@"recreation"];			
        NSLog(@"MapData: at recreation : %i", isRecreation ); 
	}
	return self;
}


// Points of Interest
-(int)loadPointsofInterest {
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isInterest = [userPreferences integerForKey:@"interest"];		
	NSLog(@"MapData: at loadInterest:  show isInterest : %i", isInterest ); 
	return isInterest; 	
}

-(id)savePointsofInterest:(int)isInterest {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isInterest forKey:@"interest"];			
        NSLog(@"MapData: at saveInterest:  show isInterest : %i", isInterest ); 
	}
	return self;
    
}

// Open Spaces
-(int)loadOpenSpaces {
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isOpenspaces = [userPreferences integerForKey:@"openspaces"];		
	NSLog(@"MapData: at isOpenspaces: show isOpenspaces: %i", isOpenspaces); 
	return isOpenspaces; 	
}

-(id)saveOpenSpaces:(int)isOpenspaces {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isOpenspaces forKey:@"openspaces"];			
		NSLog(@"MapData: at openSpaces: openSpaces: %i", isOpenspaces); 
	}
	return self;
    
}

// Landmarks 

-(int)loadLandmarks {
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isLandmarks = [userPreferences integerForKey:@"landmarks"];		
	NSLog(@"MapData: at loadLandmarks: show landmarks: %i", isLandmarks); 
	return isLandmarks; 	
}

-(id)saveLandmarks:(int)isLandmarks {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isLandmarks forKey:@"landmarks"];			
		NSLog(@"MapData: at saveLandmarks: isLandmarks: %i", isLandmarks); 
	}
	return self;
    
}


// Army Homes 

-(int)loadArmyHomes{
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isArmyHomes = [userPreferences integerForKey:@"armyHomes"];		
	NSLog(@"MapData: at loadArmyHomes: show army homes: %i", isArmyHomes); 
	return isArmyHomes; 	
}

-(id)saveArmyHomes:(int)isArmyHomes {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isArmyHomes forKey:@"armyHomes"];			
		NSLog(@"MapData: at saveArmyHomes: isArmyHomes: %i", isArmyHomes); 
	}
	return self;
    
}

// Army Buildings 

-(int)loadArmyBuildings{
	userPreferences = [NSUserDefaults standardUserDefaults];		
	NSInteger isArmyBuildings = [userPreferences integerForKey:@"armyBuildings"];		
	NSLog(@"MapData: at loadArmyBuildings: show army buildings: %i", isArmyBuildings); 
	return isArmyBuildings; 	
}

-(id)saveArmyBuildings:(int)isArmyBuildings {
    if( (self = [super init]) ) {
		userPreferences = [NSUserDefaults standardUserDefaults];	
		[userPreferences setInteger:isArmyBuildings forKey:@"armyBuildings"];			
		NSLog(@"MapData: at saveArmyBuildings: isArmyBuildings: %i", isArmyBuildings); 
	}
	return self;

}


@end
