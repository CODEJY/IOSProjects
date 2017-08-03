//
//  MyTableViewCell.h
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *portrait;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak,atomic)id delegate;
//@property (weak, nonatomic) IBOutlet UIButton *starBtn;
@property (strong,nonatomic) NSMutableArray* state;
@property (weak, nonatomic) IBOutlet UIImageView *favorate;
//- (IBAction)markBtn:(id)sender;
-(void)changeImg:(NSUInteger) row;
@end

@protocol MyTableViewCellDelegate <NSObject>
-(void) alertDialog:(MyTableViewCell*) cell;
@end
