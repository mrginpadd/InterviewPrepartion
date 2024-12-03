//
//  MVPViewController.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <UIKit/UIKit.h>
#import "MVPTableViewCellProtocol.h"
#import "MVPDemoModel.h"
#import "MVPViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVPViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, MVPTableViewCellProtocol, MVPViewProtocol>

@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong) MVPDemoModel* dataModel;
@end

NS_ASSUME_NONNULL_END
