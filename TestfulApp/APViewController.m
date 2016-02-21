//
//  APViewController.m
//  TestfulApp
//
//  Created by Alex on 20.02.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "APViewController.h"
#import "APChatTableViewController.h"
#import "APFirstScreenViewController.h"

@interface APViewController ()

@end

@implementation APViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
    
     APFirstScreenViewController* firstScreenVC = [self.storyboard instantiateViewControllerWithIdentifier:@"APFirstScreenViewController"];
     
     APChatTableViewController* chatTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"APChatTableViewController"];
    
    // увеличенная вьюха chatTVC и итоговое вью TVC не совпадали после запуска из-за statusBarFrame, пришлось корректировать высоту
    
    CGRect rectStatusBar = [[UIApplication sharedApplication] statusBarFrame];
    
    CGRect frame = CGRectMake(0, rectStatusBar.size.height, chatTVC.view.frame.size.width, chatTVC.view.frame.size.height);

    chatTVC.view.frame = frame;
    
    
    chatTVC.view.transform = CGAffineTransformMakeScale(0.7f, 0.7f);
    
     
    [self.view addSubview:chatTVC.view];
    [self.view addSubview:firstScreenVC.view];
    [self.view bringSubviewToFront:firstScreenVC.view];
    
    
     // запускаем с паузой в 0,5 сек, во время которой идет анимация в первом экране, согласно ТЗ
     // поскольку в ТЗ не указан временной интервал анимации при переходе с первого экрана на второй - ставим произвольно 1 сек, а также для наглядности оставляем анимацию в первом экране, что исправляется self.actAnimation.animationRepeatCount = 1 в контроллера первого экрана; 
     
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         
         [UIView animateWithDuration:1.0f
                           delay:0.0f
                         options:0
                      animations:^{
                          
                          
     
                          chatTVC.view.transform = CGAffineTransformIdentity;
                          
                          firstScreenVC.view.alpha = 0.0f;
                          firstScreenVC.view.transform = CGAffineTransformMakeScale(20.0f, 20.0f);
     
                      } completion:^(BOOL finished) {
                          [firstScreenVC.view removeFromSuperview];
                          [chatTVC.view removeFromSuperview];
                          [self.navigationController pushViewController:chatTVC animated:NO];
                      }];
     
     });
     
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/*
- (BOOL)prefersStatusBarHidden {
    
    return YES;
}
*/

@end
