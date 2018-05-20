//
//  TableViewCell.h
//  MVC
//
//  Created by 郭丰锐 on 2018/3/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *moiveView;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *detail;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;

@property(strong, nonatomic)Model* model;
@end
