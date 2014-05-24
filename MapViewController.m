//
//  MapViewController.m
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/8/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "MapViewController.h"
#import "LocationDataController.h"
#import "Location.h"


@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad:(BOOL)animated
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.mapView.delegate = self;

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
//nav bar
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [super viewWillAppear:animated];

}


-(void)viewDidAppear:(BOOL)animated{
    
    LocationDataController *model = [[LocationDataController alloc] init];
    Location *poi = [model getPointOfInterest];
    
    CLLocationCoordinate2D poiCoordinates;
    poiCoordinates.latitude = poi.latitude;
    poiCoordinates.longitude = poi.longitude;
    
    MKCoordinateRegion viewReion = MKCoordinateRegionMakeWithDistance(poiCoordinates, 50, 50);
//    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
//    annotationPoint.coordinate = poiCoordinates;
    
    
    [self.mapView setRegion:viewReion animated:YES];
 //   [self.mapView addAnnotations:annotationPoint];
   
}
//-(void)changeMapType:(id)sender{
//    if (mapView.mapType == MKMapTypeStandard)
//        mapView.mapType = MKMapTypeSatellite;
//    else
//        mapView.mapType = MKMapTypeStandard;
//    
//
//}

- (IBAction)zoomin:(UIBarButtonItem *)sender {
    LocationDataController *model = [[LocationDataController alloc] init];
    Location *poi = [model getPointOfInterest];
    
    CLLocationCoordinate2D poiCoordinates;
    poiCoordinates.latitude = poi.latitude;
    poiCoordinates.longitude = poi.longitude;
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(poiCoordinates, 20, 20);
    switch (mapView.mapType) {
        case MKMapTypeHybrid:
            mapView.mapType = MKMapTypeStandard;
            break;
        case MKMapTypeSatellite:
            mapView.mapType = MKMapTypeStandard;
            break;
        default:
            break;
    }
    [mapView setRegion:viewRegion animated:NO];
}

- (IBAction)changemaptype:(id)sender {
    switch (mapView.mapType) {
        case MKMapTypeStandard:
            mapView.mapType = MKMapTypeHybrid;
            break;
        case MKMapTypeSatellite:
            mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

@end
