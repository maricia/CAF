//
//  Location.h
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/8/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *photoFileName;
@property (nonatomic) float latitude;
@property (nonatomic) float longitude;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@end
