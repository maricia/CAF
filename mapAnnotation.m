//
//  mapAnnotation.m
//  CAF
//
//  Created by Maricia Alleman on 10/14/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "mapAnnotation.h"

@implementation mapAnnotation
@synthesize coordinate;

-(id)initWithLocation:(CLLocationCoordinate2D)coord{
    self = [super init];
    if (self) {
        coordinate = coord;
        coordinate.latitude = [self.latitude doubleValue];
        coordinate.longitude = [self.longitude doubleValue];
    }
    return self;
}
@end
