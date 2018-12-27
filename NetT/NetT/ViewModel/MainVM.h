//
//  MainVM.h
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "QSPViewVM.h"
#import "CommonDefine.h"
#import "MainCellM.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainVM : QSPViewVM

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, strong, readonly) QSPTableViewVM *tableViewVM;

@end

NS_ASSUME_NONNULL_END
