//
//  VendorDetailTableViewController.h
//  CAF
//
//  Created by Maricia Alleman on 11/8/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "vendor.h"

@interface VendorDetailTableViewController : UITableViewController 

@property (weak, nonatomic) IBOutlet UILabel *vendornamelabel;
@property (weak, nonatomic) IBOutlet UILabel *vfnamelname;
@property (weak, nonatomic) IBOutlet UITextView *vphone1;
@property (weak, nonatomic) IBOutlet UITextView *vphone2;
@property (weak, nonatomic) IBOutlet UITextView *vdescription;
@property (weak, nonatomic) IBOutlet UITextView *vmisc;
@property (weak, nonatomic) IBOutlet UITextView *vissues;
@property (weak, nonatomic) IBOutlet PFImageView *vendorPhoto;
@property (weak, nonatomic) IBOutlet UILabel *colorlabel;
@property (weak, nonatomic) IBOutlet UILabel *locationlabel;



@property (strong, nonatomic) vendors *vendor;

@end
