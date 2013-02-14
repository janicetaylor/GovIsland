//
//  SecondViewController.h
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
//   Map View 

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h> 
#import "TBXML.h"

#import "MapDetailViewController.h"
#import "FilterViewController.h"

#import "ArmyBuildingLocation.h"
#import "ArmyHomeLocation.h"
#import "RestroomLocation.h"
#import "FoodLocation.h"
#import "LandmarkLocation.h"
#import "OpenSpacesLocation.h"
#import "RecreationLocation.h"
#import "PointsOfInterestLocation.h"
#import "MapData.h" 

#import "GovIslandAppDelegate.h"


#define METERS_PER_MILE 1609.344  // constrain view on map

@interface SecondViewController : UIViewController <MKMapViewDelegate>{
    MKMapView *_mapView;
    TBXML *tbxml;
    
    BOOL doneInitialZoom; 
    NSString *myURL;    // holds detail view url 
    NSString *myTitle;  // holds title for navigation bar in detail view
    UIBarButtonItem *filterBtn;
    
    NSMutableArray *myArmyBuildingsURLArray; // holds all urls for army buildings 
    NSMutableArray *myArmyBuildingsArray; // holds all location points 
    NSMutableArray *myArmyHomeURLArray;
    NSMutableArray *myArmyHomeArray;
    NSMutableArray *myRestroomURLArray;
    NSMutableArray *myRestroomArray;
    NSMutableArray *myFoodURLArray;
    NSMutableArray *myFoodArray;
    NSMutableArray *myLandmarkURLArray;
    NSMutableArray *myLandmarkArray;
    NSMutableArray *myOpenSpacesURLArray;
    NSMutableArray *myOpenSpacesArray;
    NSMutableArray *myRecreationURLArray;
    NSMutableArray *myRecreationArray;
    NSMutableArray *myPointsOfInterestURLArray;
    NSMutableArray *myPointsOfInterestArray;
    
    NSMutableArray *armyBuildingAnnotArray; 
    NSMutableArray *armyHomesAnnotArray; 
    NSMutableArray *restroomAnnotArray; 
    NSMutableArray *foodAnnotArray;
    NSMutableArray *landmarksAnnotArray;
    NSMutableArray *openSpacesAnnotArray;
    NSMutableArray *recreationAnnotArray;
    NSMutableArray *poiAnnotArray;

        
    NSNumber *myArmyBuildingID;  // what army building am i on? 
    NSNumber *myArmyHomeID; 
    NSNumber *myRestroomID; 
    NSNumber *myFoodID; 
    NSNumber *myLandmarkID;
    NSNumber *myOpenSpacesID;
    NSNumber *myRecreationID;
    NSNumber *myPointsOfInterestID;
    NSString *myAnnotationType; 
    
    MapData *myMapData; 
    MKAnnotationView *myAnnotation;
    
    int isArmyBuildings;
    int isArmyHomes; 
    int isLandmarks; 
    int isOpenspaces; 
    int isInterest; 
    int isRecreation;
    int isFood; 
    int isRestrooms; 
    
    int myTag; 
    
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView; 
@property (nonatomic, retain) IBOutlet UIBarButtonItem *filterBtn;


-(void)loadXML:(NSString*)myXML;
-(void)showDetailView;
-(void)handleFilteredAnnotations; 
-(void)selectAnnotation:myID withAnnotationType:(NSString *)annotationToShow; 
-(IBAction)goToFilterSettings:(id)sender; 

@end
