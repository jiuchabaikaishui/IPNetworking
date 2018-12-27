//
//  MainM.m
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/8.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "MainCellM.h"

@implementation MainCellM

- (MainCellM * (^)(QSPNetworkingType))typeSet {
    return ^(QSPNetworkingType type) {
        self.type = type;
        
        return self;
    };
}
- (MainCellM * (^)(NSDictionary *))paramarySet {
    return ^(NSDictionary *paramary) {
        self.paramary = paramary;
        
        return self;
    };
}

@end
