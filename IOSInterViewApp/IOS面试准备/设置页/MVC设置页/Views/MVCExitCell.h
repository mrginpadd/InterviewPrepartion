//
//  MVCExitCell.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import <UIKit/UIKit.h>
#import "MVCExitModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVCExitCell : UITableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setDataSource:(MVCExitModel*)model;
@end

NS_ASSUME_NONNULL_END
