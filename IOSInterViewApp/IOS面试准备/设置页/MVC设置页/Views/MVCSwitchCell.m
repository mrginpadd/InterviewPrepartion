//
//  MVCSwitchCell.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import "MVCSwitchCell.h"

@interface MVCSwitchCell()
@property(nonatomic, strong) UILabel* titleLabel;
@property(nonatomic, strong) UILabel* subtitleLabel;
@property(nonatomic, strong) UISwitch* switchBtn;
@end

@implementation MVCSwitchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //布局ui结构
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:12];
        _subtitleLabel.textColor = [UIColor grayColor];
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _subtitleLabel.backgroundColor = [UIColor redColor];
        _subtitleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _subtitleLabel.numberOfLines = 0;
        [self.contentView addSubview:_subtitleLabel];
        
        _switchBtn = [[UISwitch alloc] init];
        _switchBtn.translatesAutoresizingMaskIntoConstraints = NO;
        _switchBtn.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_switchBtn];
        
        
//        [self setConstraints];
        
    }
    return self;
}

-(void)setConstraints {
  [NSLayoutConstraint activateConstraints:@[
     [_titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
     [_titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
     [_titleLabel.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor],
     
     [_switchBtn.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
     [_switchBtn.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
     [_switchBtn.heightAnchor constraintEqualToConstant:30],
  ]];
}

-(void)setConstraintsWithSubtitle {
  [NSLayoutConstraint activateConstraints:@[
     [_titleLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
     [_titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:15],
     [_titleLabel.heightAnchor constraintEqualToConstant:30],

     [_subtitleLabel.leadingAnchor constraintEqualToAnchor:_titleLabel.leadingAnchor],
     [_subtitleLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:10],
     [_subtitleLabel.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor constant:-90],
     
     [_switchBtn.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
     [_switchBtn.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
     [_switchBtn.heightAnchor constraintEqualToConstant:30],
     

  ]];
}

-(void)setDataSource:(MVCSwitchModel*)model {
    _titleLabel.text = model.title;
    _subtitleLabel.text = model.subtitle;
    if (model.subtitle.length > 0) {
        [self setConstraintsWithSubtitle];
    } else {
        [self setConstraints];
        [_subtitleLabel removeFromSuperview];
    }
    
    _switchBtn.on = model.switchFlag;
    [_switchBtn addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
}


-(void)switchChange:(UISwitch*)switchBtn {
    if(self.eventDelegate && [self.eventDelegate respondsToSelector:NSSelectorFromString(@"switchChange:")]) {
        [self.eventDelegate switchChange:switchBtn.on];
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
