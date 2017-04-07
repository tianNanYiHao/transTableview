//
//  TransferTableViewCell.h
//  transTableview
//
//  Created by tianNanYiHao on 2017/3/27.
//  Copyright © 2017年 tianNanYiHao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TransferPayToolSelMode;

@protocol TransferTableViewCellDelegate <NSObject>
-(void)showRightImageView:(UIButton*)btn cellDefulHeight:(CGFloat)cellDefunHeight cellAllHeight:(CGFloat)cellAllHeight;
@end




@interface TransferTableViewCell : UITableViewCell
@property (nonatomic,strong) TransferPayToolSelMode *model;
@property (nonatomic,assign) id<TransferTableViewCellDelegate> delegate;
@property (nonatomic,strong) NSMutableArray *selectArr;


+(instancetype)cellWithTableview:(UITableView*)tableView;


@end
