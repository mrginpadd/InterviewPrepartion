//
//  MVCNormalCell.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import "MVCNormalCell.h"

@interface MVCNormalCell()
@property(nonatomic, strong) UILabel* titleLabel;
@property(nonatomic, strong) UILabel* arrowTextLabel;
@property(nonatomic, strong) UIImageView* rightArrowImageView;
@end

@implementation MVCNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
      //布局UI
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_titleLabel];
        
        _arrowTextLabel = [[UILabel alloc] init];
        _arrowTextLabel.font = [UIFont systemFontOfSize:12];
        _arrowTextLabel.textColor = [UIColor grayColor];
        _arrowTextLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_arrowTextLabel];
        
        _rightArrowImageView = [[UIImageView alloc] init];
        _rightArrowImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_rightArrowImageView];
        
        [self setConstraints];
    }
    return self;
}

- (void)setConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [_titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10],
        [_titleLabel.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor],
        [_titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        [_rightArrowImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
        [_rightArrowImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [_rightArrowImageView.widthAnchor constraintEqualToConstant:15],
        [_rightArrowImageView.heightAnchor constraintEqualToConstant:15],
        
        [_arrowTextLabel.trailingAnchor constraintEqualToAnchor:_rightArrowImageView.leadingAnchor constant:-10],
        [_arrowTextLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [_arrowTextLabel.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor]
    ]];
}

-(void)setDataSource:(MVCNormalModel*)model {
    _titleLabel.text = model.title;
    _arrowTextLabel.text = model.arrowText;
    _rightArrowImageView.image = [UIImage imageNamed:@"rightArrow"];
    _rightArrowImageView.hidden = model.hideArrow;
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
