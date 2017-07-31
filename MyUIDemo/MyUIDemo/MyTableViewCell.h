//
//  MyTableViewCell.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MyTableViewCellDelegate <NSObject>
-(void) alertDialog;
@end
@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *portrait;
@property (weak, nonatomic) IBOutlet UIImageView *favorate;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (strong,atomic)id<MyTableViewCellDelegate> delegate;
@property (assign,atomic) Boolean isClickYes;
@end
