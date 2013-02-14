//
//  PointsOfInterestLocation.h
//  GovIsland
//
//  Created by Janice Garingo on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PointsOfInterestLocation : NSObject <MKAnnotation>{
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;  
    NSString *_url; 
    NSNumber *_detailID; 
}

@property (copy) NSString *name;
@property (copy) NSString *address;
@property (copy) NSString *url; 
@property (copy) NSNumber *detailID; 

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithName:(NSString*)name coordinate:(CLLocationCoordinate2D)coordinate detailViewURL:(NSString*)url detailID:(NSNumber*)detailID;

@end