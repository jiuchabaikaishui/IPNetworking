//
//  ViewController.m
//  NetT
//
//  Created by 綦帅鹏 on 2018/11/7.
//  Copyright © 2018年 綦帅鹏. All rights reserved.
//

#import "MainViewController.h"
#import "QSPNetworkingManager.h"
#import "DetailViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@end

@implementation MainViewController

#pragma mark - 属性方法
- (MainVM *)vm {
    if (_vm == nil) {
        _vm = [[MainVM alloc] init];
    }
    
    return _vm;
}

#pragma mark - 控制器周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindVM];
}


#pragma mark - 自定义方法
- (void)bindVM {
    self.title = self.vm.title;
    self.tableV.vmSet(self.vm.tableViewVM);
    @weakify(self);
    [self.vm.tableViewVM.didSelectRowSignal subscribeNext:^(QSPTableViewAndIndexPath *obj) {
        @strongify(self);
        CommonTableViewCellVM *cellVM = [self.vm.tableViewVM rowVMWithIndexPath:obj.indexPath];
        MainCellM *mainCellM = cellVM.dataM;
        QSPParameterConfig *config = [QSPParameterConfig parameterConfigWithParameters:mainCellM.paramary apiPath:mainCellM.detail cancelDependence:nil controller:nil completion:^(BOOL success, id responseObject, NSError *error) {
            @strongify(self);
            DetailViewController *nextCtr = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"DetailViewController"];
            nextCtr.vm = [DetailVM detailVMWithTitle:mainCellM.title andContext:[NSString stringWithFormat:@"接口：%@\n\n参数：%@\n\n返回：%@", mainCellM.detail, mainCellM.paramary, responseObject]];
            [self.navigationController pushViewController:nextCtr animated:YES];
        }];
        config.type = mainCellM.type;
        [QSPNetworkingManager callWithParameterConfig:config];
    }];
}

@end
