//
//  SecondViewController.m
//  GovIsland
//
//  Created by Janice Garingo on 3/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SecondViewController.h"


@implementation SecondViewController

@synthesize mapView = _mapView;
@synthesize filterBtn; 

// Implement viewDidLoad to do additional setup after loading the view
// typically from a nib.

- (void)viewWillAppear:(BOOL)animated {  
    
}

// Use this to track user location at all times
/* 
- (void)mapView:(MKMapView *)theMapView didUpdateUserLocation:(MKUserLocation *)userLocation {
   [theMapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
}
*/ 




- (void)viewDidLoad {    
   _mapView.mapType = MKMapTypeStandard; 
   _mapView.showsUserLocation = YES;
   _mapView.scrollEnabled = YES;
   _mapView.zoomEnabled = YES;

    
    // Zoom in on Fort Jay
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.6889918;
    zoomLocation.longitude = -74.0190287;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.35*METERS_PER_MILE, 0.35*METERS_PER_MILE);
    
    
    MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:viewRegion];                
    [_mapView setRegion:adjustedRegion animated:YES];     
        
    // Allocate array
    myArmyBuildingsArray = [[NSMutableArray alloc] init];
    myArmyBuildingsURLArray = [[NSMutableArray alloc] init];
    myArmyHomeArray = [[NSMutableArray alloc] init];
    myArmyHomeURLArray = [[NSMutableArray alloc] init];
    myRestroomArray = [[NSMutableArray alloc] init];
    myRestroomURLArray = [[NSMutableArray alloc] init];
    myFoodArray = [[NSMutableArray alloc] init];
    myFoodURLArray = [[NSMutableArray alloc] init];
    myLandmarkArray = [[NSMutableArray alloc] init];
    myLandmarkURLArray = [[NSMutableArray alloc] init];
    myOpenSpacesArray = [[NSMutableArray alloc] init];
    myOpenSpacesURLArray = [[NSMutableArray alloc] init];
    myRecreationArray = [[NSMutableArray alloc] init];
    myRecreationURLArray = [[NSMutableArray alloc] init];
    myPointsOfInterestArray = [[NSMutableArray alloc] init];
    myPointsOfInterestURLArray = [[NSMutableArray alloc] init];
    
    armyBuildingAnnotArray = [[NSMutableArray alloc] init];
    armyHomesAnnotArray = [[NSMutableArray alloc] init];
    restroomAnnotArray = [[NSMutableArray alloc] init];
    landmarksAnnotArray = [[NSMutableArray alloc] init];
    foodAnnotArray = [[NSMutableArray alloc] init];
    openSpacesAnnotArray = [[NSMutableArray alloc] init];
    recreationAnnotArray = [[NSMutableArray alloc] init];
    poiAnnotArray = [[NSMutableArray alloc] init];

    // Init IDs
    myArmyBuildingID = 0; 
    myArmyHomeID = 0; 
    myRestroomID = 0;
    myFoodID = 0;
    myLandmarkID = 0;
    myOpenSpacesID = 0;
    myRecreationID = 0;
    myPointsOfInterestID = 0;
    
    // Determine what points we need to add to the map
    [self handleFilteredAnnotations]; 

    // Load XML for annotation point data 
    [self loadXML:@"armyBuildings.xml"]; 
    [self loadXML:@"armyHomes.xml"]; 
    [self loadXML:@"restrooms.xml"];
    [self loadXML:@"food.xml"];
    [self loadXML:@"landmarks.xml"];
    [self loadXML:@"openSpaces.xml"];
    [self loadXML:@"recreation.xml"];
    [self loadXML:@"pointsOfInterest.xml"];
    

    [super viewDidLoad];
}


// Show/hide annotations based on filter 
-(void)handleFilteredAnnotations {
    myMapData = [[MapData alloc] init];	
    
    NSLog(@"isFirstTime: %i", [myMapData loadFirstTime]); 
    if([myMapData loadFirstTime] == 0) {
        [myMapData saveFirstTime:1]; 
        
        [myMapData saveArmyBuildings:1];
        [myMapData saveArmyHomes:1];
        [myMapData saveLandmarks:1];
        [myMapData saveOpenSpaces:1];
        [myMapData savePointsofInterest:1];
        [myMapData saveRecreation:1];
        [myMapData saveFood:1];
        [myMapData saveRestrooms:1];
    }
    

    
     // Load saved annotations based on filter settings 
     isArmyBuildings = [myMapData loadArmyBuildings]; 
     isArmyHomes = [myMapData loadArmyHomes]; 
     isLandmarks = [myMapData loadLandmarks]; 
     isOpenspaces = [myMapData loadOpenSpaces]; 
     isInterest = [myMapData loadPointsofInterest]; 
     isRecreation = [myMapData loadRecreation]; 
     isFood = [myMapData loadFood]; 
     isRestrooms = [myMapData loadRestrooms]; 
        
    [myMapData release]; 
    
}


// !! 
/*
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    
    id<MKAnnotation> myAnnotation = [self.mapView.annotations objectAtIndex:0];
    [self.mapView selectAnnotation:myAnnotation animated:NO];
}
*/ 


-(void)selectAnnotation:(NSNumber *)myID withAnnotationType:(NSString *)annotationToShow{
        
    NSLog(@"selectAnnotation: myID: %@. myAnnotationType: %@", myID, annotationToShow);
    
    if([annotationToShow isEqualToString:@"Army Buildings"]){
       [self.mapView selectAnnotation:[armyBuildingAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Army Homes"]){
        [self.mapView selectAnnotation:[armyHomesAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Restroom"]){
        [self.mapView selectAnnotation:[restroomAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Landmarks"]){
        [self.mapView selectAnnotation:[landmarksAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Food"]){
        [self.mapView selectAnnotation:[foodAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Open Spaces"]){
        [self.mapView selectAnnotation:[openSpacesAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Recreation"]){
        [self.mapView selectAnnotation:[recreationAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }
    if([annotationToShow isEqualToString:@"Points of Interest"]){
        [self.mapView selectAnnotation:[poiAnnotArray objectAtIndex:[myID intValue]] animated:NO];
    }

}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    NSLog(@"calloutAccessoryControlTapped");
    
}


-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
    
    myAnnotation = (MKAnnotationView *)view.annotation;
    NSLog(@"didSelectAnnotationView: %@", myAnnotation);
    NSLog(@"view.annotation.title: %@", view.annotation.title); 

}


-(void)loadXML:(NSString*)myXML {
    
    // Load map.xml file    
   //  tbxml = [[TBXML tbxmlWithXMLFile:@"armyBuildings.xml"] retain];
     tbxml = [[TBXML tbxmlWithXMLFile:myXML] retain];
    
    // Obtain root element
	TBXMLElement *root = tbxml.rootXMLElement;

    
    // if root element is valid
	if(root) {
        
        // search for the first location element within the root element's children
		TBXMLElement *location = [TBXML childElementNamed:@"location" parentElement:root];
        NSString *tempClass = [TBXML valueOfAttributeNamed:@"annotationType" forElement:root];

       // NSLog(@"annotation type is: %@", tempClass);

        // get annotation type from XML file 
                
        // if location element was found
		while (location != nil) {
            
            CLLocationCoordinate2D coordinate;
            NSString *name = [TBXML valueOfAttributeNamed:@"name" forElement:location];
            NSString *latitudeStr = [TBXML valueOfAttributeNamed:@"latitude" forElement:location];
            NSString *longitudeStr = [TBXML valueOfAttributeNamed:@"longitude" forElement:location];
            NSString *tempURL = [TBXML valueOfAttributeNamed:@"url" forElement:location];
            // NSString *tempTitle = [TBXML valueOfAttributeNamed:@"title" forElement:location];
            
            coordinate.latitude = [latitudeStr floatValue];
            coordinate.longitude = [longitudeStr floatValue];
            
            // ArmyBuildingLocation
            if([tempClass isEqualToString:@"ArmyBuildingLocation"]) {
                // create annotion point 
                ArmyBuildingLocation *annotationArmyBuilding = [[ArmyBuildingLocation alloc] init];
            
                // instantiate annotation object            
                annotationArmyBuilding = [[[ArmyBuildingLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myArmyBuildingID] autorelease];
                                
                // Show/hide correct annotations 
                if (isArmyBuildings == 1) { 
                    [_mapView addAnnotation:annotationArmyBuilding]; 
                }                

                // NSLog(@"annotationArmyBuilding.name is: %@", annotationArmyBuilding.name);
                //  NSLog(@"annotationArmyBuilding.url is: %@", annotationArmyBuilding.url);
                
                // Add annotation names to array 
                [myArmyBuildingsArray addObject:annotationArmyBuilding.name];
                [myArmyBuildingsURLArray addObject:annotationArmyBuilding.url];
                [armyBuildingAnnotArray addObject:annotationArmyBuilding];                 
                
                // Set up ID for annotation points 
                myArmyBuildingID = [NSNumber numberWithInt:[myArmyBuildingID intValue] + 1]; 
               
                // NSLog(@"myArmyBuildingID is: %d", [myArmyBuildingID intValue]);
                // NSLog(@"myArmyBuildingsArray is: %@", myArmyBuildingsArray);

            }
            
            // ArmyHomeLocation
            if([tempClass isEqualToString:@"ArmyHomeLocation"]) {
                // create annotion point 
                ArmyHomeLocation *annotationArmyHome = [[ArmyHomeLocation alloc] init];
                
                // instantiate annotation object            
                annotationArmyHome = [[[ArmyHomeLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myArmyHomeID] autorelease];
                
                if(isArmyHomes == 1) {
                    [_mapView addAnnotation:annotationArmyHome]; 
                }
                
                // NSLog(@"annotationArmyBuilding.name is: %@", annotationArmyBuilding.name);
                // NSLog(@"annotationArmyHome.url is: %@", annotationArmyHome.url);
                
                // Add annotation names to array 
                [myArmyHomeArray addObject:annotationArmyHome.name];
                [myArmyHomeURLArray addObject:annotationArmyHome.url];
                [armyHomesAnnotArray addObject:annotationArmyHome];
                
                // Set up ID for annotation points 
                myArmyHomeID = [NSNumber numberWithInt:[myArmyHomeID intValue] + 1]; 
                
                // NSLog(@"myArmyHomeID is: %d", [myArmyHomeID intValue]);
                // NSLog(@"myArmyBuildingsArray is: %@", myArmyBuildingsArray);
                
            }
            
            //RestroomLocation
            if([tempClass isEqualToString:@"RestroomLocation"]) {
                // create annotion point 
                RestroomLocation *annotationRestroom = [[RestroomLocation alloc] init];
                
                // instantiate annotation object            
                annotationRestroom  = [[[RestroomLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myRestroomID] autorelease];
                
                if(isRestrooms == 1) {
                    [_mapView addAnnotation:annotationRestroom]; 
                }
                
                // Add annotation names to array 
                [myRestroomArray addObject:annotationRestroom.name];
                [myRestroomURLArray addObject:annotationRestroom.url];
                [restroomAnnotArray addObject:annotationRestroom];

                
                // NSLog(@"annotationRestroom.url is: %@", annotationRestroom.url);

                // Set up ID for annotation points 
                myRestroomID = [NSNumber numberWithInt:[myRestroomID intValue] + 1]; 
            }
            
            //FoodLocation
            if([tempClass isEqualToString:@"FoodLocation"]) {
                // create annotion point 
                FoodLocation *annotationFood = [[FoodLocation alloc] init];
                
                // instantiate annotation object            
                annotationFood   = [[[FoodLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myFoodID] autorelease];
                if(isFood == 1) {
                    [_mapView addAnnotation:annotationFood]; 
                }
                
                // Add annotation names to array 
                [myFoodArray addObject:annotationFood.name];
                [myFoodURLArray addObject:annotationFood.url];
                [foodAnnotArray addObject:annotationFood];
                                
                // Set up ID for annotation points 
                myFoodID = [NSNumber numberWithInt:[myFoodID intValue] + 1]; 
            }

            //LandmarkLocation
            if([tempClass isEqualToString:@"LandmarkLocation"]) {
                // create annotion point 
                LandmarkLocation *annotationLandmark = [[LandmarkLocation alloc] init];
                
                // instantiate annotation object            
                annotationLandmark = [[[LandmarkLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myLandmarkID] autorelease];
                
                if(isLandmarks == 1) {
                    [_mapView addAnnotation:annotationLandmark]; 
                }
                
                // Add annotation names to array 
                [myLandmarkArray addObject:annotationLandmark.name];
                [myLandmarkURLArray addObject:annotationLandmark.url];
                [landmarksAnnotArray addObject:annotationLandmark];

                
                // Set up ID for annotation points 
                myLandmarkID = [NSNumber numberWithInt:[myLandmarkID intValue] + 1]; 
            } 
            // end LandmarkLocation
            
            // OpenSpacesLocation
            if([tempClass isEqualToString:@"OpenSpacesLocation"]) {
                // create annotion point 
                OpenSpacesLocation *annotationOpenSpaces = [[OpenSpacesLocation alloc] init];
                
                // instantiate annotation object            
                annotationOpenSpaces = [[[OpenSpacesLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myOpenSpacesID] autorelease];
                
                if(isOpenspaces == 1) {
                    [_mapView addAnnotation:annotationOpenSpaces]; 
                }
                
                // Add annotation names to array 
                [myOpenSpacesArray addObject:annotationOpenSpaces.name];
                [myOpenSpacesURLArray addObject:annotationOpenSpaces.url];
                [openSpacesAnnotArray addObject:annotationOpenSpaces];
                
                // Set up ID for annotation points 
                myOpenSpacesID = [NSNumber numberWithInt:[myOpenSpacesID intValue] + 1]; 
            } 
            // end OpenSpacesLocation
            
            // RecreationLocation
            if([tempClass isEqualToString:@"RecreationLocation"]) {
                // create annotion point 
                RecreationLocation *annotationRecreation = [[RecreationLocation alloc] init];
                
                // instantiate annotation object            
                annotationRecreation = [[[RecreationLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myRecreationID] autorelease];
                
                if(isRecreation == 1) {
                    [_mapView addAnnotation:annotationRecreation]; 
                }
                    
                // Add annotation names to array 
                [myRecreationArray addObject:annotationRecreation.name];
                [myRecreationURLArray addObject:annotationRecreation.url];
                [recreationAnnotArray addObject:annotationRecreation];

                
                // Set up ID for annotation points 
                myRecreationID = [NSNumber numberWithInt:[myRecreationID intValue] + 1]; 
            } 
            // end RecreationLocation
            
            // PointsOfInterestLocation
            if([tempClass isEqualToString:@"PointsOfInterestLocation"]) {
                // create annotion point 
                PointsOfInterestLocation *annotationInterest = [[PointsOfInterestLocation alloc] init];
                
                // instantiate annotation object            
                annotationInterest = [[[PointsOfInterestLocation alloc] initWithName:name coordinate:coordinate detailViewURL:tempURL detailID:myPointsOfInterestID] autorelease];
                
                if(isInterest == 1) {
                    [_mapView addAnnotation:annotationInterest]; 
                }
                
                // Add annotation names to array 
                [myPointsOfInterestArray addObject:annotationInterest.name];
                [myPointsOfInterestURLArray addObject:annotationInterest.url];
                [poiAnnotArray addObject:annotationInterest];

                
                // Set up ID for annotation points 
                myPointsOfInterestID = [NSNumber numberWithInt:[myPointsOfInterestID intValue] + 1]; 
            } 
            // end PointsOfInterestLocation
            
            // move onto next location in xml file 
            location = [TBXML nextSiblingNamed:@"location" searchFromElement:location];
        
        } // end location while loop
        
        
      
    } // end if(root) 
    
    // release resources
	[tbxml release];
       
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
   // NSLog(@"calling: mapView viewForAnnotation");
        
    static NSString *armyBuildingIdentifier = @"ArmyBuildingLocation";  
    static NSString *armyHomeIdentifier = @"ArmyHomeLocation";
    static NSString *restroomIdentifier = @"RestroomLocation";
    static NSString *foodIdentifier = @"FoodLocation";
    static NSString *landmarkIdentifier = @"LandmarkLocation";
    static NSString *openSpacesIdentifier = @"OpenSpacesLocation";
    static NSString *recreationIdentifier = @"RecreationLocation";
    static NSString *poiIdentifier = @"PointsOfInterestLocation";

    // Handle ArmyBuildingLocation 
    if ([annotation isKindOfClass:[ArmyBuildingLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:armyBuildingIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:armyBuildingIdentifier];
           
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            // !! 
            annotationView.image = [UIImage imageNamed:@"m-armyBuildings.png"]; 
            
            ArmyBuildingLocation *tempArmyBuildingAnnotation = annotation; 
           //  NSLog(@"tempArmyBuildingAnnotation: %i", [tempArmyBuildingAnnotation.detailID intValue] );
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

            [rightButton addTarget:self
                            action:@selector(showArmyBuildingDetails:)
                  forControlEvents:UIControlEventTouchUpInside];       
            
            //store the index of the ArmyBuildingLocation item so that we can retrieve it again later
            rightButton.tag = [tempArmyBuildingAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton; 
            
        } 
  
        else {
            annotationView.annotation = annotation;
        }
       
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
    
        return annotationView;
    } 
    // end ArmyBuildingLocation 
    
    // Handle ArmyHomeLocation 
    else if ([annotation isKindOfClass:[ArmyHomeLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:armyHomeIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:armyHomeIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            ArmyHomeLocation *tempArmyHomeAnnotation = annotation; 

            annotationView.image = [UIImage imageNamed:@"m-armyHomes.png"]; 
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showArmyHomeDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the ArmyBuildingLocation item so that we can retrieve it again later
            rightButton.tag = [tempArmyHomeAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end ArmyHomeLocation
    
    // Handle RestroomLocation 
    else if ([annotation isKindOfClass:[RestroomLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:restroomIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:restroomIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            RestroomLocation *tempRestroomAnnotation = annotation; 
            
            annotationView.image = [UIImage imageNamed:@"m-bathroom.png"]; 
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showRestroomDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the item so that we can retrieve it again later
            rightButton.tag = [tempRestroomAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end RestroomLocation

    // Handle FoodLocation 
    else if ([annotation isKindOfClass:[FoodLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:foodIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:foodIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            FoodLocation *tempFoodAnnotation = annotation; 
            
            annotationView.image = [UIImage imageNamed:@"m-food.png"]; 
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showFoodDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the item so that we can retrieve it again later
            rightButton.tag = [tempFoodAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end FoodLocation
    
    // Handle LandmarkLocation 
    else if ([annotation isKindOfClass:[LandmarkLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:landmarkIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:landmarkIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            LandmarkLocation *tempLandmarkAnnotation = annotation; 
            
            annotationView.image = [UIImage imageNamed:@"m-landmarks.png"]; 
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showLandmarkDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the item so that we can retrieve it again later
            rightButton.tag = [tempLandmarkAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end LandmarkLocation
    
    // Handle OpenSpacesLocation 
    else if ([annotation isKindOfClass:[OpenSpacesLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:openSpacesIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:openSpacesIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            OpenSpacesLocation *tempOpenSpacesAnnotation = annotation; 
            
            annotationView.image = [UIImage imageNamed:@"m-openSpaces.png"]; 
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showOpenSpacesDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the item so that we can retrieve it again later
            rightButton.tag = [tempOpenSpacesAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end OpenSpacesLocation

    // Handle RecreationLocation 
    else if ([annotation isKindOfClass:[RecreationLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:recreationIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:recreationIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            RecreationLocation *tempRecreationAnnotation = annotation; 
            
            annotationView.image = [UIImage imageNamed:@"m-recreation.png"]; 
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showRecreationDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the item so that we can retrieve it again later
            rightButton.tag = [tempRecreationAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end RecreationLocation
    
    // Handle PointsOfInterestLocation 
    else if ([annotation isKindOfClass:[PointsOfInterestLocation class]]) {  
        
        MKAnnotationView *annotationView = (MKAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:poiIdentifier];
        if (annotationView == nil) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:poiIdentifier];
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            
            PointsOfInterestLocation *tempPoiAnnotation = annotation; 
            
            annotationView.image = [UIImage imageNamed:@"m-pointsOfInterest.png"]; 
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showPointsOfInterestDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            
            //store the index of the item so that we can retrieve it again later
            rightButton.tag = [tempPoiAnnotation.detailID intValue]; 
            
            annotationView.rightCalloutAccessoryView = rightButton;  
            
        } 
        
        else {
            annotationView.annotation = annotation;
        }
        
        // for MKPinAnnotationView only 
        // annotationView.animatesDrop = YES; 
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.opaque = NO;
        
        return annotationView;
    } 
    // end PointsOfInterestLocation 


    
    return nil;    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark MKMapViewDelegate

// Army Building Details 
- (void)showArmyBuildingDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myArmyBuildingsURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myArmyBuildingsArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [armyBuildingAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Army Buildings"; 
    
    NSLog(@"actual annotation point is: %@" , [armyBuildingAnnotArray objectAtIndex:tempButton.tag]);
    NSLog(@"object i clicked on is: %@" , [myArmyBuildingsArray objectAtIndex:tempButton.tag]);
    NSLog(@"tempButton.tag is: %i" , tempButton.tag);
    // NSLog(@"url of what i clicked on is: %@" , [myArmyBuildingsURLArray objectAtIndex:tempButton.tag]);
    
    // NSLog(@"myURL is: %@", myURL);
    [self showDetailView]; 

}

// Army Home Details
- (void)showArmyHomeDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myArmyHomeURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myArmyHomeArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [armyHomesAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Army Homes"; 
        
    [self showDetailView]; 
}


// Restroom Details
- (void)showRestroomDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myRestroomURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myRestroomArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [restroomAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Restroom"; 
    
    [self showDetailView]; 
}

// Food Details
- (void)showFoodDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myFoodURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myFoodArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [foodAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Food"; 
    [self showDetailView]; 
}

// Landmark Details
- (void)showLandmarkDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myLandmarkURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myLandmarkArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [landmarksAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Landmarks"; 
    [self showDetailView]; 
}

// Open Spaces Details
- (void)showOpenSpacesDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myOpenSpacesURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myOpenSpacesArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [openSpacesAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Open Spaces"; 
    [self showDetailView]; 
}

// Recreation Details
- (void)showRecreationDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myRecreationURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myRecreationArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [openSpacesAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Recreation"; 
    [self showDetailView]; 
}

// PointsOfInterest Details
- (void)showPointsOfInterestDetails:(id)sender {
    UIControl *tempButton = sender;
    myURL = [myPointsOfInterestURLArray objectAtIndex:tempButton.tag]; 
    myTitle = [myPointsOfInterestArray objectAtIndex:tempButton.tag]; 
    myAnnotation = [poiAnnotArray objectAtIndex:tempButton.tag]; 
    myTag = tempButton.tag;
    myAnnotationType = @"Points of Interest"; 
    [self showDetailView]; 
}

- (void)showDetailView {            
    NSNumber *tempNum = [NSNumber numberWithInt:myTag];
    
    MapDetailViewController *mapDetailViewController = [[MapDetailViewController alloc] initWithNibName:@"MapDetailViewController" bundle:nil];
    mapDetailViewController.myURLStr = myURL;
    mapDetailViewController.myNavBarTitle = myTitle; 
    mapDetailViewController.annotationID = tempNum;
    mapDetailViewController.myAnnotationType = myAnnotationType;
  
    NSLog(@"at showDetailView. myAnnotation: %i. tempNum: %@. myAnnotationType: %@", myTag, tempNum, myAnnotationType);
    mapDetailViewController.myAnnotation = myAnnotation; 
    
    [self.view addSubview:mapDetailViewController.view];

}

-(IBAction)goToFilterSettings:(id)sender {
    NSLog(@"go to filter settings");
    FilterViewController *filterViewController = [[FilterViewController alloc] initWithNibName:@"FilterViewController" bundle:nil];
    [self.view addSubview:filterViewController.view];
}

- (void)dealloc { 
    [poiAnnotArray release];
    [recreationAnnotArray release];
    [openSpacesAnnotArray release];
    [foodAnnotArray release];
    [landmarksAnnotArray release];
    [restroomAnnotArray release];
    [armyHomesAnnotArray release];
    [armyBuildingAnnotArray release];
    [filterBtn release]; 
    [myURL release]; myURL = nil; 
    [_mapView release];
    [myArmyBuildingsURLArray release];
    [myArmyBuildingsArray release];
    [myArmyHomeURLArray release];
    [myArmyHomeArray release];
    [myRestroomArray release];
    [myRestroomURLArray release];
    [myFoodURLArray release];
    [myFoodArray release];
    [myLandmarkURLArray release];
    [myLandmarkArray release];
    [myOpenSpacesURLArray release];
    [myOpenSpacesArray release];
    [myRecreationURLArray release];
    [myRecreationArray release];
    [myPointsOfInterestURLArray release];
    [myPointsOfInterestArray release];
    
    [super dealloc];
}

@end
