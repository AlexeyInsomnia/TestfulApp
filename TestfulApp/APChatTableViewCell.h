//
//  APChatTableViewCell.h
//  TestfulApp
//
//  Created by Alex on 20.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APChatTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UILabel *fullnameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UILabel *unreadMessagesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *sendingDateLabel;

@end
