//
//  ABContact.h
//  AddressBook
//
//  Created by AY on 8/30/14.
//  Copyright (c) 2014 AY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABContact : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *telephoneNumber;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) UIImage *avatar;

@end
