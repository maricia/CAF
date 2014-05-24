//
//  ViewController.m
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/7/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "ViewController.h"
#import "LocationDataController.h"
#import "Location.h"


@interface ViewController ()
@property (strong,nonatomic)UIImageView *imageView;

@end

@implementation ViewController

@synthesize imageView = _imageView;



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


}

-(void)viewDidAppear:(BOOL)animated{
    LocationDataController *model = [[LocationDataController alloc] init];
    Location *poi = [model getPointOfInterest];
    
    self.addressLabel.text = poi.address;
    [self.photoImageView setImage:[UIImage imageNamed:poi.photoFileName]];
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
