//
//  VendorDetailViewController.h
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/7/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vendors.h"
@class VendorDetailViewController;


@protocol VendorDetailViewControllerDelegate <NSObject>
-(void)VendorDetailViewControllerDidCancel:
 (VendorDetailViewController *)controller;
-(void)VendorDetailViewControllerDidSave:
 (VendorDetailViewController *)controller;
@end


@interface VendorDetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *name;




@end
