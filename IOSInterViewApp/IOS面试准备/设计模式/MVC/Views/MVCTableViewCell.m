//
//  MVCTableViewCell.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "MVCTableViewCell.h"

@implementation MVCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return self;
}
- (instancetype)initWithTitle:(NSString *)title val:(NSInteger *)val reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if(self) {
        //布局UI
        [self setupViews];
        //初始化UI数据
        self.titleLabel.text = title;
        self.valLabel.text = [NSString stringWithFormat:@"%d", val];
    }
    return self;
}

- (void)setupViews {
    //titleLabel
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO; //关闭自动约束
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    self.titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:self.titleLabel];
    
    //valLabel
    self.valLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.valLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.valLabel.font = [UIFont systemFontOfSize:14];
    self.valLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:self.valLabel];
    
    //addbtn
    self.addBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    self.addBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.addBtn setTitle:@"加" forState:UIControlStateNormal];
    [self.addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.addBtn addTarget:self action:@selector(didTapAddButtonInCell:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.addBtn];
    
    //设置约束
    [self setupConstraints];
}

- (void)setupConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        [self.addBtn.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
        [self.addBtn.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
//        [self.addBtn.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor constant:-10],
        
        [self.valLabel.centerYAnchor constraintEqualToAnchor: self.contentView.centerYAnchor],
        [self.valLabel.trailingAnchor constraintEqualToAnchor: self.addBtn.leadingAnchor constant:-15]
        
    ]];
}

- (void)configureWithTitle:(NSString *)title val:(NSInteger)val {
    // 更新单元格的内容
    self.titleLabel.text = title;
    self.valLabel.text = [NSString stringWithFormat:@"%ld", (long)val];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)didTapAddButtonInCell:(UITableViewCell *)cell {
    if ([self.delegate respondsToSelector:@selector(didTapAddButtonInCell:)]) {
        [self.delegate didTapAddButtonInCell:self];
    }
}
@end
