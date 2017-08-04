//
//  TableViewCell4.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "TableViewCell4.h"

@implementation TableViewCell4

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/*// ios8 之后可以自动识别出来subview
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
 
 self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
 if (self) {
 
 //不要把控件add到view上
 //add到contentView才是你最正确的选择
     [self.contentView addSubview:self.city];
     [self.contentView addSubview: self.selectCity];
 }
    
 return self;
 }*/

- (IBAction)selectCity:(id)sender {
    [self.delegate goSelectCityView];
    
}
@end
