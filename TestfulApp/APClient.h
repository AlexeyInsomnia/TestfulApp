//
//  APClient.h
//  TestfulApp
//
//  Created by Alex on 21.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APClient : NSObject

@property (assign, nonatomic) NSInteger identifier;

@property (strong, nonatomic) NSString* fullname;

@property (strong, nonatomic) NSURL* avatarURL;

@property (strong, nonatomic) NSString* message;

@property (assign, nonatomic) NSInteger unreadMessagesCount;

@property (strong, nonatomic) NSString*   sendingDate;

+ (APClient*) initWithDataPlist: (NSDictionary*) dictionaryFromDataPlist ;

@end
