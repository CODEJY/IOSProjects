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
        [self.delegate alertDialog:self];
    
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
-(void) changeImg:(NSUInteger)row
{
        //do some method.....
        if ([self.state[row] isEqualToString:@"nonstar"]) {
            self.favorate.image = [UIImage imageNamed:@"star"];
            [self.state replaceObjectAtIndex:row withObject:@"star"];
          
        }
        else
        {
            self.favorate.image = [UIImage imageNamed:@"nonstar"];
            [self.state replaceObjectAtIndex:row withObject:@"nonstar"];
        }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
