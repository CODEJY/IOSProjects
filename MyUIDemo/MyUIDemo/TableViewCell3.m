//
//  TableViewCell3.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "TableViewCell3.h"

@implementation TableViewCell3

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.datePicker = [[UIDatePicker alloc] init];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker.backgroundColor = [UIColor whiteColor];
    [self.datePicker addTarget:self action:@selector(chooseDate:) forControlEvents:UIControlEventValueChanged];
    self.textField.inputView = self.datePicker;
    // Do any additional setup after loading the view from its nib.
}
//datePicker日期改变时调用的函数
-(void)chooseDate:(UIDatePicker*) datePicker
{
    NSDate* date = datePicker.date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd";
    NSString* dateString = [formatter stringFromDate:date];
    self.textField.text = dateString;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
