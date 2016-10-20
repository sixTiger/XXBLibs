//
//  XXBTextField.m
//  Pods
//
//  Created by xiaobing on 16/4/26.
//
//

#import "XXBTextField.h"

@implementation XXBTextField
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self prepare];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepare];
    }
    return self;
}

- (void)prepare {
    self.maxTextCount = NSUIntegerMax;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        [self _addNotitication];
    } else {
        [self _removeNotifaction];
    }
}

- (void)_addNotitication {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:)name:UITextFieldTextDidChangeNotification object:self];
}

- (void)_removeNotifaction {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:self];
}

-(void)textFiledEditChanged:(NSNotification *)obj {
    UITextField *textField = (UITextField *)obj.object;
    NSString *toBeString = textField.text;
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        if (toBeString.length > self.maxTextCount) {
            NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.maxTextCount];
            if (rangeIndex.length == 1) {
                textField.text = [toBeString substringToIndex:self.maxTextCount];
            } else {
                NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxTextCount - 1)];
                textField.text = [toBeString substringWithRange:rangeRange];
            }
        }
    }
}
@end
