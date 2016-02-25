//
//  APClient.m
//  TestfulApp
//
//  Created by Alex on 21.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APClient.h"

@implementation APClient

+ (APClient*) initWithDataPlist: (NSDictionary*) dictionaryFromDataPlist {
   
    APClient* client = [[APClient alloc] init];
    
    client.fullname = [dictionaryFromDataPlist objectForKey:@"fullname"];
    
    NSString* urlString = [dictionaryFromDataPlist objectForKey: @"avatarURL"];
    
    if (urlString) {
        client.avatarURL = [NSURL URLWithString:urlString];
    }
    
    client.message = [dictionaryFromDataPlist objectForKey:@"message"];
    
    client.identifier = [[dictionaryFromDataPlist objectForKey:@"identifier"] integerValue];
    
    client.unreadMessagesCount = [[dictionaryFromDataPlist objectForKey:@"unreadMessagesCount"] integerValue];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    
    [dateFormater setDateFormat:@"hh:mm a"];
    
    client.sendingDate = [dateFormater stringFromDate:[dictionaryFromDataPlist objectForKey:@"sendingDate"]];
    
    return client;
}

@end
