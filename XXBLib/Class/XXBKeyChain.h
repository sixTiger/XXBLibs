//
//  XXBKeyChain.h
//  XXBLibDemo
//
//  Created by baidu on 16/12/15.
//  Copyright © 2016年 杨小兵. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XXBSingleton.h"

/*
 * 默认serversID
 */
UIKIT_EXTERN NSString *const XXBKeyChainKeyServersID;
@interface XXBKeyChain : NSObject
XXBSingletonH(XXBKeyChain);

- (void)setKeyChainServrs:(NSString *)servers;

- (void)loadServers;

- (void)save:(NSString *)service data:(id)data;
- (id)load:(NSString *)service;

@end
