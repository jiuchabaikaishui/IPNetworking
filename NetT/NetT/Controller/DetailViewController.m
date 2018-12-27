//
//  DetailViewController.m
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textV;

@end

@implementation DetailViewController

#pragma mark - 属性方法

#pragma mark - 控制器周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindVM];
}


#pragma mark - 自定义方法
- (void)bindVM {
    self.title = self.vm.title;
    self.textV.text = self.vm.context;
}

@end
