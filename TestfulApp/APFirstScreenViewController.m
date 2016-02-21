//
//  APFirstScreenViewController.m
//  TestfulApp
//
//  Created by Alex on 20.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APFirstScreenViewController.h"

@interface APFirstScreenViewController ()

@property (strong, nonatomic) NSMutableArray* actsArray;

@end

@implementation APFirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self animationsOnStart];
    
    // Do any additional setup after loading the view.
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
    self.animImage.animationRepeatCount = 20;
    [self.animImage startAnimating];
    
}


/*
 - (BOOL)prefersStatusBarHidden {
 
 return YES;
 }
 */

@end
