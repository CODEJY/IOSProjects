//
//  MyTableViewCell.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/7/31.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([touch view] == self.favorate)
    {
        
        NSLog(@"%d",[self.delegate alertDialog]);
        
      /*  if ([self.delegate alertDialog]) {
        UIImage* image = [UIImage imageNamed:@"nonstar"];
        //do some method.....
            if ([self.favorate.image isEqual:image]) {
                NSLog(@"yes");
            self.favorate.image = [UIImage imageNamed:@"star"];
            }
        else
        {
            NSLog(@"no");
           self.favorate.image = [UIImage imageNamed:@"nonstar"];
        }
        NSLog(@"ghh");
        }*/
        
    }
    
}
/*-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //不要把控件add到view上
        //add到contentView才是你最正确的选择
        
        [self.contentView addSubview:self.label1];
        
        [self.contentView addSubview:self.label];
    }
    return self;
}*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
