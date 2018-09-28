//
//  WXJAutoAdjustKeyboardTextFieldC.h
//  键盘上移控件
//
//  Created by wxj on 2018/9/27.
//  Copyright © 2018年 zkml－wxj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LHWAutoAdjustKeyboardTextField : UITextField

//上移后，textField需要额外高于键盘顶部的距离，默认为0
@property (nonatomic, assign) CGFloat offset;

//需要向上移动的view，默认为keyWindow
@property (nonatomic, weak) UIView *movingView;

@end
