//
//  MVCViewController.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <UIKit/UIKit.h>
#import "MVCTableViewCell.h"
#import "MVCDemoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVCViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MVCTableViewCellDelegate>

@property(nonatomic, strong, readwrite) UITableView *tableView;
@property(nonatomic, strong) MVCDemoModel *dataModel;
@end

NS_ASSUME_NONNULL_END
