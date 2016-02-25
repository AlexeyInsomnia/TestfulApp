//
//  APFirstScreenViewController.m
//  TestfulApp
//
//  Created by Alex on 20.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APFirstScreenViewController.h"
#import "APChatTableViewController.h"
#import "APTransitionAnimator.h"

@interface APFirstScreenViewController () <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) NSMutableArray* actsArray;

@end

@implementation APFirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self animationsOnStart];
    
    APChatTableViewController* chatTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"APChatTableViewController"];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        chatTVC.transitioningDelegate = self;
        
        //chatTVC.modalPresentationStyle = UIModalPresentationCustom;
        
        [self presentViewController:chatTVC animated:YES completion:nil];
        
        
    });

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) animationsOnStart {
    
  
    self.actsArray = [[NSMutableArray alloc] init];
    
    for (int i=4; i<7; i++) {
        NSString* imageName = [NSString stringWithFormat:@"act%d",i];
        UIImage* image = [UIImage imageNamed:imageName];
        [self.actsArray addObject:image];
    }
    for (int i=1; i<5; i++) {
        NSString* imageName = [NSString stringWithFormat:@"act%d",i];
        UIImage* image = [UIImage imageNamed:imageName];
        [self.actsArray addObject:image];
    }
    
    self.animImage.animationImages = self.actsArray;
    self.animImage.animationDuration = 0.5f;
    self.animImage.animationRepeatCount = 1;
    [self.animImage startAnimating];
    
}




#pragma mark - UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                            presentingController:(UIViewController *)presenting
                                                                                sourceController:(UIViewController *)source {
    
    APTransitionAnimator *animator = [[APTransitionAnimator alloc] init];
  
    return animator;
}
    

/*
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    APTransitionAnimator *animator = [[APTransitionAnimator alloc] init];
    return animator;
}
 
*/


@end
