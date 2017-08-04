//
//  TableViewCell2.m
//  MyUIDemo
//
//  Created by GARY WU (MBC-ISD-OOCLL/ZHA) on 2017/8/1.
//  Copyright © 2017年 OOCL. All rights reserved.
//

#import "TableViewCell2.h"

@implementation TableViewCell2

-(NSArray*) data
{
    if (!_data)
    {
        _data = [[NSArray alloc] initWithObjects:@"Male",@"Female", nil];
    }
    return _data;
}
/*-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //不要把控件add到view上
        //add到contentView才是你最正确的选择
        
        [self.contentView addSubview:self.selectedView];
        
        [self.contentView addSubview:self.label];
        [self pickerView:nil didSelectRow:0 inComponent:0];
        
    }
    return self;
}*/

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectedView = [[UIPickerView alloc] init];
    self.textField.inputView = self.selectedView;
    self.selectedView.backgroundColor = [UIColor whiteColor];
    self.selectedView.dataSource = self;
    self.selectedView.delegate = self;
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
   // NSLog(@"数据%ld,%@",row,[_data objectAtIndex:row]);
 
    NSLog(@"有没有data");
    return [self.data objectAtIndex:row];
}
//当选中时
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:
(NSInteger)row inComponent:(NSInteger)component
{
    self.textField.text = self.data[row];
}

@end
