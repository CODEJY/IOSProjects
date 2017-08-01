//
//  TableViewCell2.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "TableViewCell2.h"

@implementation TableViewCell2

-(NSArray*)data
{
    if (! _data)
    {
        _data = [NSArray arrayWithObjects:@"Man",@"Woman", nil];
    }
    return _data;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected  animated:animated];

    // Configure the view for the selected state
}
//多少列
-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//多少行
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 2;
}

-(NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回teams中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用teams中的第几个元素
    
    return [_data objectAtIndex:row];
}
//当选中时
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    // 使用一个UIAlertView来显示用户选中的列表项
    UIAlertView* alert = [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:[NSString stringWithFormat:@"你的性别是：%@"
                                   , [ _data objectAtIndex:row]]
                          delegate:nil
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}
@end
