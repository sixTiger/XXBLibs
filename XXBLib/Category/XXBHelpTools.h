//
//  XXBHelpTools.h
//  Pix72
//
//  Created by 杨小兵 on 15/5/27.
//  Copyright (c) 2015年 xiaoxiaobing. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "XXBSingleton.h"

@interface XXBHelpTools : NSObject
XXBSingletonH(XXBHelpTools);
/**
 *  根据 asset 获取图片
 *
 *  @param asset 图片资源
 *
 *  @return 获取到的图片
 */
- (UIImage *) getUIImageFromAssets: (ALAsset *) asset;
/**
 *  根据 asset 获取图片
 *
 *  @param asset 图片资源
 *  @param size  图片的最大大小
 *
 *  @return 获取到的图片
 */
- (UIImage *)thumbnailForAsset:(ALAsset *)asset maxPixelSize:(NSUInteger)size;
@end
