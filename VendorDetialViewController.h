//
//  VendorDetialViewController.h
//  CAF
//
//  Created by Maricia Alleman on 11/3/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "vendor.h"

@interface VendorDetialViewController : UIViewController < UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate >

@property (weak, nonatomic) IBOutlet UITextField *colortextfield;
@property (weak, nonatomic) IBOutlet UITextField *locationtextfield;
@property (weak, nonatomic) IBOutlet PFImageView *vendorPhoto;
@property (weak, nonatomic) IBOutlet UITextField *vfullnametextfield;
@property (weak, nonatomic) IBOutlet UITextView *vphone1txtbox;
@property (weak, nonatomic) IBOutlet UITextView *vnametextbox;

@property (weak, nonatomic) IBOutlet UITextField *vdescriptiontextfield;
@property (weak, nonatomic) IBOutlet UITextField *vsneedstextfield;
@property (weak, nonatomic) IBOutlet UITextView *vissuestextbox;

@property (strong, nonatomic) IBOutlet UIButton *phone1;




- (IBAction)phone1:(id)sender;
- (IBAction)imessage1:(id)sender;


@property (strong, nonatomic) vendors *vendor;

@end
