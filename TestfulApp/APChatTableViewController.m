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

@interface APChatTableViewController ()

@property (strong, nonatomic) NSMutableArray* clientsArray;

@end

@implementation APChatTableViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 200;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.clientsArray = [NSMutableArray array];
    
    //  берем данные из plist
    
    [self initializeDataPlist];
    
    // если нужно взять данные с сервера
    
    [self getClientsFromServer];
    
    /*
    NSLog(@"%@", [[self.clientsArray objectAtIndex:0] sendingDate]);
    NSLog(@"%ld", [(APClient*)[self.clientsArray objectAtIndex:0] identifier]);
    NSLog(@"%@", [[self.clientsArray objectAtIndex:0] fullname]);
    */
    
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
        
        APChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        
        if (!cell) {
            cell = [[APChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        APClient* client = [self.clientsArray objectAtIndex:indexPath.row];
        
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
    

    dispatch_async(dispatch_get_main_queue(), ^{
        
        [cell.avatarImage setImageWithURLRequest:request
                                placeholderImage:nil
                                         success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull image) {
                                             weakCell.avatarImage.image = image;
                                             
                                             weakCell.avatarImage.layer.cornerRadius = weakCell.avatarImage.bounds.size.height/2.0f;
                                             weakCell.avatarImage.layer.masksToBounds = YES;
                                             
                                             [weakCell layoutSubviews];
                                         } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {  
                                             weakCell.avatarImage.backgroundColor = placeHoldersColor;
                                             weakCell.avatarImage.layer.cornerRadius = weakCell.avatarImage.bounds.size.height/2.0f;
                                             weakCell.avatarImage.layer.masksToBounds = YES;
                                             
                                         }];
    });
    
        return cell;
 
}

- (void) initializeDataPlist {
    
    NSString* pathToDataPlist = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    
    NSArray* deafaultDataPlistArray = [NSArray arrayWithContentsOfFile:pathToDataPlist];
    
    for (NSDictionary* dataPlist in deafaultDataPlistArray) {
        
        APClient* client = [APClient initWithDataPlist:dataPlist];
        
        [self.clientsArray addObject:client];
        
    }
}


#pragma mark - API

- (void) getClientsFromServer {
    
   
   //  for example if we got array of clients from server, we can
   // [self.clientsArray addObjectsFromArray:clientsArrayfromServer];
   
}


// спрячем верхний статус бар

/*
 - (BOOL)prefersStatusBarHidden {
 
 return YES;
 }
 
 */

@end
