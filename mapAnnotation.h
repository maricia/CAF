//
//  mapAnnotation.h
//  CAF
//
//  Created by Maricia Alleman on 10/14/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface mapAnnotation : NSObject <MKAnnotation>{
CLLocationCoordinate2D coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

-(id)initWithLocation:(CLLocationCoordinate2D)coord;

@property (nonatomic, strong)NSString *place;
@property (nonatomic, strong)NSNumber *latitude;
@property (nonatomic, strong)NSNumber *longitude;
@property (nonatomic, strong)NSString *imageName;


//other methods and properties

@end
