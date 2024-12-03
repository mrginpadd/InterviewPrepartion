//
//  MVCTableViewCell.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol MVCTableViewCellDelegate <NSObject>

- (void)didTapAddButtonInCell:(UITableViewCell *)cell;

@end


@interface MVCTableViewCell : UITableViewCell
@property(nonatomic, strong, readwrite) UILabel *titleLabel;
@property(nonatomic, strong, readwrite) UILabel *valLabel;
@property(nonatomic, strong, readwrite) UIButton *addBtn;

@property(nonatomic, weak) id<MVCTableViewCellDelegate> delegate;

-(instancetype)initWithTitle:(NSString*)title val:(NSInteger*)val reuseIdentifier:(NSString *)reuseIdentifier;

- (void)configureWithTitle:(NSString *)title val:(NSInteger)val;
@end

NS_ASSUME_NONNULL_END
