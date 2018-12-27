//
//  DetailVM.h
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "QSPViewVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailVM : QSPViewVM

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *context;

+ (instancetype)detailVMWithTitle:(NSString *)title andContext:(NSString *)context;
- (instancetype)initWithTitle:(NSString *)title andContext:(NSString *)context;

@end

NS_ASSUME_NONNULL_END
