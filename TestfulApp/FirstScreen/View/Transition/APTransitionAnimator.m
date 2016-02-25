//
//  APTransitionAnimator.m
//  TestfulApp
//
//  Created by Alex on 24.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APTransitionAnimator.h"

@implementation APTransitionAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    // Grab the from and to view controllers from the context
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // Set our ending frame. We'll modify this later if we have to
    
    self.endFrame = [transitionContext finalFrameForViewController:self.toViewController];
    
    [transitionContext.containerView addSubview:self.fromViewController.view];
    [transitionContext.containerView addSubview:self.toViewController.view];
    
    [transitionContext.containerView bringSubviewToFront:self.fromViewController.view];
    
    
    
    [self setStartingParametersFromViewController];
    [self setStartingParametersToViewController];
    
 
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                        
                         [self setEndingParametersFromViewController];
                         [self setEndingParametersToViewController];
                         
                     }
                     completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
    

}

- (void) setStartingParametersFromViewController {
    
    self.fromViewController.view.alpha = 1.0;
    self.fromViewController.view.frame = self.endFrame;

}

- (void) setEndingParametersFromViewController {
    
    self.fromViewController.view.alpha = 0.0;
    self.fromViewController.view.transform = CGAffineTransformMakeScale(20.0f, 20.0f);
}

- (void) setStartingParametersToViewController {
    
    self.toViewController.view.frame = self.endFrame;
    self.toViewController.view.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
}

- (void) setEndingParametersToViewController {
    
    self.toViewController.view.transform = CGAffineTransformIdentity;
    self.toViewController.view.frame = self.endFrame;
}

@end
