//
//  vendor.h
//  CAF
//
//  Created by Maricia Alleman on 11/3/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface vendors : NSObject

@property(nonatomic, strong) NSString *Name; //name of vendor
@property(nonatomic, strong) NSString *location; //location of vendor
@property(nonatomic, strong) NSString *color; //color of vendor space
@property(nonatomic, strong) NSString *description; //description of vendor
@property(nonatomic, strong) NSString *fname; //contact first name
@property(nonatomic, strong) NSString *lname; //contact last name
@property(nonatomic, strong) NSString *phone; //contact phone 1
@property(nonatomic, strong) NSString *phone2; //contact phone2
@property(nonatomic, strong) NSString *special; //special needs
@property(nonatomic, strong) NSString *issues; //issues
@property(nonatomic, strong) PFFile *image; //vendor image

//-(BOOL)textfield;


@end
