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

/**
 *  设置默认参数等先关操作
 */
- (void)prepare NS_REQUIRES_SUPER;
@end
