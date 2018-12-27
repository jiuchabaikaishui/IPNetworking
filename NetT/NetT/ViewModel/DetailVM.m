//
//  DetailVM.m
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "DetailVM.h"

@implementation DetailVM

+ (instancetype)detailVMWithTitle:(NSString *)title andContext:(NSString *)context {
    return [[self alloc] initWithTitle:title andContext:context];
}
- (instancetype)initWithTitle:(NSString *)title andContext:(NSString *)context {
    if (self = [super init]) {
        self.title = title;
        self.context = context;
    }
    
    return self;
}

@end
