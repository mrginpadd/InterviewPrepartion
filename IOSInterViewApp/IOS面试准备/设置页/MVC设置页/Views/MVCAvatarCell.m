//
//  MVCAvatarCell.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/16.
//

#import "MVCAvatarCell.h"
#import "MVCAvatarModel.h"
@interface MVCAvatarCell()
@property(nonatomic, strong) UIStackView *stackView;
@property(nonatomic, strong) UIImageView *avatarImageView;
@property(nonatomic, strong) UILabel *nickNameLabel;
@property(nonatomic, strong) UILabel *subtitleLabel;
@property(nonatomic, strong) UIImageView *rightImageView;
@end
@implementation MVCAvatarCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
    
      //布局UI样式位置
        _stackView = [[UIStackView alloc] initWithFrame:CGRectZero];
        _stackView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_stackView];
        
        //avatarImageView
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
       
        [_stackView addSubview:_avatarImageView];
        
        //nickNameLabel
        _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nickNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nickNameLabel.font = [UIFont boldSystemFontOfSize:15];
        _nickNameLabel.textColor = [UIColor blackColor];
        [_stackView addSubview:_nickNameLabel];
        
        
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _subtitleLabel.font = [UIFont systemFontOfSize:10];
        _subtitleLabel.textColor = [UIColor grayColor];
        [_stackView addSubview:_subtitleLabel];
        
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        [_stackView addSubview:_rightImageView];
        

        //设置约束
        [self setConstraints];
       
    }
    return self;
}

- (void)setConstraints {
    [NSLayoutConstraint activateConstraints:@[
        [self.stackView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.stackView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.stackView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.stackView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        //_avatarImageView
        [self.avatarImageView.widthAnchor constraintEqualToAnchor:_stackView.heightAnchor constant:-10],
        [self.avatarImageView.heightAnchor constraintEqualToAnchor:_stackView.heightAnchor constant:-10],
        [self.avatarImageView.leadingAnchor constraintEqualToAnchor:_stackView.leadingAnchor constant:10],
        [self.avatarImageView.centerYAnchor constraintEqualToAnchor:_stackView.centerYAnchor],
        
//        //_nickNameLabel
        [self.nickNameLabel.heightAnchor constraintEqualToConstant:30],
        [self.nickNameLabel.leadingAnchor constraintEqualToAnchor:_avatarImageView.trailingAnchor constant:10],
        [self.nickNameLabel.bottomAnchor constraintEqualToAnchor:_avatarImageView.centerYAnchor constant:5],

//        //_subtitleLabel
        [self.subtitleLabel.leadingAnchor constraintEqualToAnchor:_nickNameLabel.leadingAnchor],
        [self.subtitleLabel.topAnchor constraintEqualToAnchor:_nickNameLabel.bottomAnchor constant:10],
        [self.subtitleLabel.heightAnchor constraintEqualToConstant:25],
//
//        //rightImageView
        [self.rightImageView.widthAnchor constraintEqualToConstant:20],
        [self.rightImageView.heightAnchor constraintEqualToConstant:20],
        [self.rightImageView.trailingAnchor constraintEqualToAnchor:_stackView.trailingAnchor],
        [self.rightImageView.centerYAnchor constraintEqualToAnchor:_stackView.centerYAnchor]
        
        
    ]];
    
}

- (void)setDataSource:(MVCAvatarModel *)model {
    _stackView.backgroundColor = [UIColor grayColor];
    NSURL *imageURL = [NSURL URLWithString:model.avatarUrl];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            //更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                self.avatarImageView.image = image;
                self.avatarImageView.backgroundColor = [UIColor grayColor];
            });
        }
    }];
    [task resume];

    
    self.nickNameLabel.text = model.nickName;
    self.nickNameLabel.backgroundColor = [UIColor blueColor];
    
    self.subtitleLabel.text = model.subtitle;
    self.subtitleLabel.backgroundColor = [UIColor greenColor];
    
    self.rightImageView.backgroundColor = [UIColor whiteColor];
    self.rightImageView.image = [UIImage imageNamed:@"rightArrow"];
    self.rightImageView.hidden = model.hideAccesory;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.height/2;
    self.avatarImageView.layer.masksToBounds = YES;
  
//    self.rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
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
