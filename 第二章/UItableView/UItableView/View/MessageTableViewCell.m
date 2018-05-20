//
//  MessageTableViewCell.m
//  UItableView
//
//  Created by 郭丰锐 on 2018/3/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "MessageModel.h"
@implementation MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.iconView.layer.cornerRadius = self.iconView.frame.size.width/2;
    }
    return self;
}

- (void)setCellContentWithModel:(MessageModel*)model{
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.timeLabel.text = model.time;
    self.messageLabel.text = model.message;
    self.nameLabel.text = model.name;
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
