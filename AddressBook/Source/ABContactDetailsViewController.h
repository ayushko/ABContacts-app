//
//  ABContactDetailsViewController.h
//  AddressBook
//
//  Created by AY on 8/30/14.
//  Copyright (c) 2014 AY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABContact.h"

@interface ABContactDetailsViewController : UIViewController <UITextFieldDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) ABContact *contact;

@end
