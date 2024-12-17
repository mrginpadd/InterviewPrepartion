//
//  MVCSwitchCell.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import <UIKit/UIKit.h>
#import "MVCSwitchModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol MVCSwitchProtocol <NSObject>
-(void)switchChange:(BOOL)val;
@end

@interface MVCSwitchCell : UITableViewCell
@property(nonatomic, weak) id<MVCSwitchProtocol> eventDelegate;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)setDataSource:(MVCSwitchModel*)model;
@end

NS_ASSUME_NONNULL_END
