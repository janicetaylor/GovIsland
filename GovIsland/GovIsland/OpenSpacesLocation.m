//
//  OpenSpacesLocation.m
//  GovIsland
//
//  Created by Janice Garingo on 4/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OpenSpacesLocation.h"

@implementation OpenSpacesLocation
@synthesize name = _name;
@synthesize address = _address;
@synthesize url = _url; 
@synthesize coordinate = _coordinate;
@synthesize detailID = _detailID;

- (id)initWithName:(NSString*)name coordinate:(CLLocationCoordinate2D)coordinate detailViewURL:(NSString*)url detailID:(NSNumber*)detailID {
    if ((self = [super init])) {
        _name = [name copy];
        _coordinate = coordinate;
        _url = [url copy]; 
        _detailID = [detailID copy]; 
    }
    return self;
}

- (NSNumber *)locationDetailID {
    return _detailID; 
}

- (NSString *)title {
    return _name;
}

- (NSString *)detailViewURL {
    return _url; 
}

- (NSString *)subtitle {
    return _address;
}

-(void)dealloc {
    [_name release]; _name = nil;
    [_address release]; _address = nil;
    [_url release]; _url = nil; 
    [_detailID release]; _detailID = nil; 
    
    [super dealloc];
}


@end
