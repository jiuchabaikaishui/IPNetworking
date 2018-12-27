//
//  MainM.h
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "CommonM.h"
#import "QSPNetworkingManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainCellM : CommonM

@property (nonatomic, assign) QSPNetworkingType type;
@property (nonatomic, copy) NSDictionary *paramary;

- (MainCellM * (^)(QSPNetworkingType))typeSet;
- (MainCellM * (^)(NSDictionary *))paramarySet;

@end

NS_ASSUME_NONNULL_END
