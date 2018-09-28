//
//  ViewController.m
//  键盘上移控件
//
//  Created by wxj on 2018/9/27.
//  Copyright © 2018年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"
#import "LHWAutoAdjustKeyboardTextField.h"

@interface ViewController ()<UITextFieldDelegate>{
    LHWAutoAdjustKeyboardTextField *textField;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    textField = [[LHWAutoAdjustKeyboardTextField alloc]initWithFrame:CGRectMake(40, [UIScreen mainScreen].bounds.size.height-100, [UIScreen mainScreen].bounds.size.width-80, 60)];
    textField.placeholder = @"请输入需要填写的问题";
    textField.backgroundColor = [UIColor cyanColor];
    textField.movingView = self.view;
    textField.offset = 20;
    [self.view addSubview:textField];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
