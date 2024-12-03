//
//  MVPTableViewCell.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MVPTableViewCellDelegate <NSObject>

- (void)didTapAddBtnInCell:(UITableViewCell*)cell;

@end

@interface MVPTableViewCell : UITableViewCell
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *valLabel;
@property(nonatomic, strong) UIButton *addBtn;

@property(nonatomic, weak) id<MVPTableViewCellDelegate> delegate;

- (instancetype)initWithTitle: (NSString*)title val:(NSInteger*)val reuseIdentifier:(NSString *)reuseIdentifier;
@end

NS_ASSUME_NONNULL_END
