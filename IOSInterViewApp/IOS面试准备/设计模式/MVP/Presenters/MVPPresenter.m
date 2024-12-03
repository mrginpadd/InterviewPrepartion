//
//  MVPPresenter.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "MVPPresenter.h"
#import "MVPDemoModel.h"
@interface MVPPresenter()
@property(nonatomic, weak) id<MVPViewProtocol> view;
@property(nonatomic, strong) MVPDemoModel *demoModel;
@end

@implementation MVPPresenter
- (instancetype)initWithView:(id<MVPViewProtocol>) view {
    self = [super init];
    if (self) {
        _view = view;
    }
    return self;
}

- (void)loadData {
    self.demoModel = [[MVPDemoModel alloc] init];
    if (self.demoModel) {
        //获取到数据更新视图
        [self.view loadData];
    } else {
        
    }
}


@end
