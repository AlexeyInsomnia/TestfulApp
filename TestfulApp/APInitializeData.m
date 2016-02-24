//
//  APInitializeData.m
//  TestfulApp
//
//  Created by Alex on 25.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APInitializeData.h"
#import "APClient.h"

@implementation APInitializeData

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString* pathToDataPlist = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        
        NSArray* deafaultDataPlistArray = [NSArray arrayWithContentsOfFile:pathToDataPlist];
        
        for (NSDictionary* dataPlist in deafaultDataPlistArray) {
            
            APClient* client = [APClient initWithDataPlist:dataPlist];
            
            [self.clientsArray addObject:client];
            
        }
    }
    return self;
}

@end
