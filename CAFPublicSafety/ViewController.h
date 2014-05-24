//
//  ViewController.h
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/7/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.m"

@interface ViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

@end
