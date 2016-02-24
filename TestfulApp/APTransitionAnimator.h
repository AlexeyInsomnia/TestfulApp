//
//  APTransitionAnimator.h
//  TestfulApp
//
//  Created by Alex on 24.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface APTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (strong, nonatomic) UIViewController *fromViewController;

@property (strong, nonatomic) UIViewController *toViewController;

@property (assign, nonatomic) CGRect endFrame;



@end
