//
//  ABContactDetailsViewController.m
//  AddressBook
//
//  Created by AY on 8/30/14.
//  Copyright (c) 2014 AY. All rights reserved.
//

#import "ABContactDetailsViewController.h"

@interface ABContactDetailsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *editAvatarButton;


@end

@implementation ABContactDetailsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.contact == nil) {
        // Init contact object
        
        self.contact = [ABContact new];
        
        // Enable Edit Mode
        [self.lastNameTextField setEnabled:YES];
        [self.firstNameTextField setEnabled:YES];
        [self.numberTextField setEnabled:YES];
        [self.emailTextField setEnabled:YES];
        [self.doneButton setHidden:NO];
        [self.cancelButton setHidden:NO];
        [self.editAvatarButton setHidden:NO];
        
        self.firstNameTextField.delegate = self;
        self.lastNameTextField.delegate = self;
        self.numberTextField.delegate = self;
        self.emailTextField.delegate = self;
        
    }
    else {
        // Show contact info
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if ([textField isEqual:self.lastNameTextField]) {
        if (!textField.text.length) return NO;
        else [self.firstNameTextField becomeFirstResponder];
    }
    else if ([textField isEqual:self.firstNameTextField]) {
        [self.numberTextField becomeFirstResponder];
    }
    else if ([textField isEqual:self.numberTextField]) {
        [self.emailTextField becomeFirstResponder];
    }
    else if ([textField isEqual:self.emailTextField]) {
    
        if ([self isValidEmail:textField.text]){
            [self.emailTextField resignFirstResponder];
        }
        else {
            NSLog(@"EMAIL IS INVALID");
            return NO;
        }
        
    }
    return YES;
}

-(BOOL) isValidEmail:(NSString *)email {

    if (email.length > 1) return YES;
    else return NO;
}

#pragma mark - IBActions

- (IBAction)doneEdit:(id)sender {
    
    self.contact.lastName = self.lastNameTextField.text;
    self.contact.firstName = self.firstNameTextField.text;
    self.contact.telephoneNumber = self.numberTextField.text;
    self.contact.email = self.emailTextField.text;
    self.contact.avatar = self.avatarImageView.image;
    
    [self.navigationController popViewControllerAnimated:YES];

//save contacts to NSUserDefaults
    
//    [NSUserDefaults standardUserDefaults] setObject:<#(id)#> forKey:<#(NSString *)#>
//    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (IBAction)editPhotoAction:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete photo" otherButtonTitles:@"Take a picture", @"Select from library", nil];
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setAllowsEditing:YES];
    
    switch (buttonIndex) {
        case 0:
            self.avatarImageView.image = nil;
            break;
        case 1:

#if TARGET_IPHONE_SIMULATOR == 1
            [self.avatarImageView setImage:[UIImage imageNamed:@"dummyPhoto.png"]];
#else
            [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
#endif

            break;
        case 2:
            [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
            [self presentViewController:picker animated:YES completion:nil];
            break;
        default:
            break;
    }
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [self.avatarImageView setImage:[info valueForKey:UIImagePickerControllerEditedImage]];
 
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
