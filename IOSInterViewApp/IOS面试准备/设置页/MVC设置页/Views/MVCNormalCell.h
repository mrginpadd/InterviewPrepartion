//
//  MVCNormalCell.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import <UIKit/UIKit.h>
#import "MVCNormalModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVCNormalCell : UITableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setDataSource:(MVCNormalModel*)model;
@end

NS_ASSUME_NONNULL_END
