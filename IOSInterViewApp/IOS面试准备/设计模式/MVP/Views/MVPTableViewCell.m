//
//  MVPTableViewCell.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "MVPTableViewCell.h"

@implementation MVPTableViewCell

- (instancetype)initWithTitle: (NSString*)title val:(NSInteger*)val reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
        _titleLabel.text = title;
        _valLabel.text = [NSString stringWithFormat:@"%ld", val];
    }
    return self;
}

- (void)setupViews {
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.valLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.valLabel.font = [UIFont systemFontOfSize:24];
    self.valLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:self.valLabel];
    
    self.addBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.addBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addBtn setTitle:@"加" forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.addBtn addTarget:self action:@selector(didTapAddBtnInCell:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.addBtn];
    
    [self setConstraints];
}

- (void)setConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        [self.valLabel.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor],
        [self.valLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        [self.addBtn.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
        [self.addBtn.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
    ]];
}

- (void)didTapAddBtnInCell:(UITableViewCell*)cell {
    if ([self.delegate respondsToSelector:@selector(didTapAddBtnInCell:)]) {
        [self.delegate didTapAddBtnInCell:self];
    }
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
