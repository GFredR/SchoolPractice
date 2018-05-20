//
//  MessageTableViewCell.h
//  UItableView
//
//  Created by 郭丰锐 on 2018/3/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageModel;
@interface MessageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *messageLabel;

- (void)setCellContentWithModel:(MessageModel*)model;

@end
