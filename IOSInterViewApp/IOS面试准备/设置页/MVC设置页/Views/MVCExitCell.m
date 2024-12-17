//
//  MVCExitCell.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import "MVCExitCell.h"
@interface MVCExitCell()
@property(nonatomic, strong)UILabel *titleLabel;
@end

@implementation MVCExitCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //布局UI
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.textColor = [UIColor redColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
        
        [self setConstraints];
    }
    return self;
}

-(void)setConstraints {
    [NSLayoutConstraint activateConstraints:@[
      [_titleLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
      [_titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
      [_titleLabel.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor],
      [_titleLabel.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor]
    ]];
}

-(void)setDataSource:(MVCExitModel*)model {
    _titleLabel.text = model.title;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
