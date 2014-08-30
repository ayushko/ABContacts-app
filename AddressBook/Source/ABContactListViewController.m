//
//  ABContactListViewController.m
//  AddressBook
//
//  Created by AY on 8/30/14.
//  Copyright (c) 2014 AY. All rights reserved.
//

#import "ABContactListViewController.h"

@interface ABContactListViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addBarButtonItem;
@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;

@end

@implementation ABContactListViewController


#pragma mark - VievController Lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];

    //maybe we need a functionality to delete conatct if this contact is hu*lo ^_^
}


#pragma mark - IBActions

- (IBAction)addButtonAction:(id)sender {
    
    [self performSegueWithIdentifier:@"ABPushDetailsVC" sender:sender];
}



#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ABPushDetailsVC"]) {
        if (![sender isEqual:self.addBarButtonItem]) {
            
        }
    }
    
}


@end
