//
//  MapViewController.h
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/8/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>


@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)zoomin:(id)sender;
- (IBAction)changemaptype:(id)sender;


@end
