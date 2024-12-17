//
//  MVCAvatarCell.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/16.
//

#import <UIKit/UIKit.h>
#import "MVCAvatarCell.h"
#import "MVCAvatarModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVCAvatarCell : UITableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setDataSource:(MVCAvatarModel *)model;
@end

NS_ASSUME_NONNULL_END
