//
//  XXBTextField.h
//  Pods
//
//  Created by xiaobing on 16/4/26.
//
//

#import <UIKit/UIKit.h>

@interface XXBTextField : UITextField

@property(nonatomic , assign) NSUInteger   maxTextCount;

- (void)prepare NS_REQUIRES_SUPER;
@end
