//
//  LocationDataController.m
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/8/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "LocationDataController.h"

@implementation LocationDataController

- (Location*)getPointOfInterest{
    
    Location *myLocation = [[Location alloc] init];
    myLocation.address = @"CAF,9600 Write Drive,Midland,TX 79706";
    myLocation.photoFileName = @"cafmappic.png";
    myLocation.latitude = 31.94314;
    myLocation.longitude = -102.212269;
    myLocation.title = @"caf";
    myLocation.subtitle = @"caf headquarters";
    
    return myLocation;
}

//-(Location*)getannotationPoint{
//    
//CLLocationCoordinate2D annotationCoord;
//annotationCoord.latitude = 31.94314;
//annotationCoord.longitude = -102.212269;
//
//MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
//annotationPoint.coordinate = annotationCoord;
//annotationPoint.title = @"CAF";
//annotationPoint.subtitle = @"CAF HeadQuarters";
//[mapView addAnnotation:annotationPoint];
//}

@end
/*@implementation LocationDataController

@end*/
