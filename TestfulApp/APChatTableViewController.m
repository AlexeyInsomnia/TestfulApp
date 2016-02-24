//
//  APChatTableViewController.m
//  TestfulApp
//
//  Created by Alex on 20.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APChatTableViewController.h"
#import "APChatTableViewCell.h"
#import "APClient.h"
#import "UIImageView+AFNetworking.h"
#import "APInitializeData.h"


@interface APChatTableViewController ()

@property (strong, nonatomic) NSMutableArray* clientsArray;

@end

@implementation APChatTableViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 200;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    APInitializeData* data = [[APInitializeData alloc] init];
    
    self.clientsArray = data.clientsArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.clientsArray count];
    
   }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString* identifier = @"Cell";
    
    APClient* client = [self.clientsArray objectAtIndex:indexPath.row];
   
    APChatTableViewCell *cell = (APChatTableViewCell*)[tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    if (!cell) {
            
            cell = [[APChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
    }
        
    cell.fullnameLabel.text = client.fullname;
    
    cell.messageLabel.text = client.message;
    
    
    if (client.unreadMessagesCount == 0) {
        cell.unreadMessagesCountLabel.text = @"0 messages";
    } else {
        cell.unreadMessagesCountLabel.text = [NSString stringWithFormat:@"+%ld messages",(long)client.unreadMessagesCount];
    }
    
    cell.sendingDateLabel.text = client.sendingDate;
    
    
  
    NSURLRequest* request = [NSURLRequest requestWithURL:client.avatarURL];
     
    __weak APChatTableViewCell* weakCell = cell;
     
    cell.avatarImage.image = nil;
     
    UIColor* placeHoldersColor = [UIColor colorWithRed:200.0/255.0f green:200.0/255.0f blue:200.0/255.0f alpha:1.0];
    
    cell.avatarImage.layer.cornerRadius = cell.avatarImage.bounds.size.height/2.0f;
    
    cell.avatarImage.layer.masksToBounds = YES;
    
    cell.avatarImage.backgroundColor = placeHoldersColor;
    
    dispatch_async(dispatch_get_main_queue(), ^{
     
     [cell.avatarImage setImageWithURLRequest:request
                             placeholderImage:nil
                                      success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                          
                                          weakCell.avatarImage.image = image;
                                          [weakCell layoutSubviews];
                                          
                                      } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
                                        
                                      }];
     
     
    });
    
        return cell;
}


@end
