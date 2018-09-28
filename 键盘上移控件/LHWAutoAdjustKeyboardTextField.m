//
//  WXJAutoAdjustKeyboardTextFieldC.m
//  键盘上移控件
//
//  Created by wxj on 2018/9/27.
//  Copyright © 2018年 zkml－wxj. All rights reserved.
//

#import "LHWAutoAdjustKeyboardTextField.h"
@interface LHWAutoAdjustKeyboardTextField()
@property (nonatomic, assign) CGRect originalFrame;
@end

@implementation LHWAutoAdjustKeyboardTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self onInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self onInit];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)onInit {
    [self addKeyboardNotifications];
    _movingView = [UIApplication sharedApplication].keyWindow;
    _originalFrame = CGRectZero;
}

- (void)addKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWillShow: (NSNotification *)notification {
    if (self.isFirstResponder) {
        CGPoint relativePoint = [self convertPoint: CGPointZero toView: [UIApplication sharedApplication].keyWindow];
        
        CGFloat keyboardHeight = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        CGFloat overstep = CGRectGetHeight(self.frame) + relativePoint.y + keyboardHeight - CGRectGetHeight([UIScreen mainScreen].bounds);
        overstep += self.offset;
        
        if (CGRectEqualToRect(self.originalFrame, CGRectZero)) {
            self.originalFrame = self.movingView.frame;
        }
        
        if (overstep > 0) {
            CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
            CGRect frame = self.originalFrame;
            frame.origin.y -= overstep;
            [UIView animateWithDuration: duration delay: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
                self.movingView.frame = frame;
            } completion: nil];
        }
    }
}

- (void)keyboardWillHide: (NSNotification *)notification {
    if (self.isFirstResponder) {
        CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        [UIView animateWithDuration: duration delay: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
            self.movingView.frame = self.originalFrame;
        } completion: nil];
        self.originalFrame = CGRectZero;
    }
}


@end
