//
//  UIImage+Help.h
//  2014_11_20_PIX72
//
//  Created by Mac10.9 on 14-11-21.
//  Copyright (c) 2014年 xiaoxiaobing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Help)
/**
 *  根据颜色创建一个image 图片1 * 1
 *
 *  @param color image的颜色
 *
 *  @return 穿件好的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据颜色创建一个image
 *
 *  @param color image的颜色
 *
 *  @param size 图片的大小
 *
 *  @return 穿件好的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;
/**
 *  拉伸图片
 *
 *  @param name 图片名字
 *
 *  @return 拉伸好的图片
 */
+ (UIImage * )resizedImageWithImageName:(NSString *)name;
/**
 *  拉伸图片
 *
 *  @param image 要拉伸的图片
 *
 *  @return 拉伸好的图片
 */
+ (UIImage * )resizedImageWithImage:(UIImage *)image;
/**
 *  返回一个缩放好的图片
 *
 *  @param image  要切割的图片
 *  @param imageSize 边框的宽度
 *
 *  @return 切割好的图片
 */
+(UIImage *)cutImage:(UIImage*)image andSize:(CGSize)imageSize;
/**
 *  返回一个下边有半个红圈的原型头像
 *
 *  @param image  要切割的图片
 *
 *  @return 切割好的头像
 */
+(UIImage *)captureCircleImage:(UIImage*)image;

/**
 *  根据url返回一个圆形的头像
 *
 *  @param iconUrl 头像的URL
 *  @param border  边框的宽度
 *  @param color   边框的颜色
 *
 *  @return 切割好的头像
 */
+ (UIImage *)captureCircleImageWithURL:(NSString *)iconUrl andBorderWith:(CGFloat)border andBorderColor:(UIColor *)color;

/**
 *  根据iamge返回一个圆形的头像
 *
 *  @param iconImage 要切割的头像
 *  @param border    边框的宽度
 *  @param color     边框的颜色
 *
 *  @return 切割好的头像
 */
+ (UIImage *)captureCircleImageWithImage:(UIImage *)iconImage andBorderWith:(CGFloat)border andBorderColor:(UIColor *)color;
/**
 *  生成毛玻璃效果的图片
 *
 *  @param image      要模糊化的图片
 *  @param blurAmount 模糊化指数
 *
 *  @return 返回模糊化之后的图片
 */
+ (UIImage *)blurredImageWithImage:(UIImage *)image andBlurAmount:(CGFloat)blurAmount;
/**
 *  截取想赢的view生成一张图片
 *
 *  @param view 要截的view
 *
 *  @return 生成的图片
 */
+ (UIImage *)viewShotWithView:(UIView *)view;
/**
 *  截屏
 *
 *  @return 返回截屏的图片
 */
+ (UIImage * )screenShot;

/**
 *  给图片添加水印
 *
 *  @param bgName         原图的名字
 *  @param waterImageName 水印的名字
 *
 *  @return 添加完水印的图片
 */
+ (UIImage *)waterImageWithBgImageName:(NSString *)bgName andWaterImageName:(NSString *)waterImageName ;

/**
 *  图片进行压缩
 *
 *  @param image   要压缩的图片
 *  @param percent 要压缩的比例(建议在0.3以上)
 *
 *  @return 压缩之后的图片
 *
 *  @exception 压缩之后为image/jpeg 格式
 */
+ (UIImage *)reduceImage:(UIImage *)image percent:(float)percent;

/**
 *  对图片进行压缩
 *
 *  @param image   要压缩的图片
 *  @param newSize 压缩后的图片的像素尺寸
 *
 *  @return 压缩好的图片
 */
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

/**
 *  生成了一个毛玻璃效果的图片
 *
 *  @return 返回模糊化好的图片
 */
- (UIImage *)blurredImage:(CGFloat)blurAmount;
/**
 *  生成一个毛玻璃效果的图片
 *
 *  @param blurLevel 毛玻璃的模糊程度
 *
 *  @return 毛玻璃好的图片
 */
- (UIImage *)blearImageWithBlurLevel:(CGFloat)blurLevel;

#pragma mark - 苹果官方提供的图片模糊的类

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
//| ----------------------------------------------------------------------------
//! Applies a blur, tint color, and saturation adjustment to @a inputImage,
//! optionally within the area specified by @a maskImage.
//!
//!         The source image.  A modified copy of this image will be returned.
//! @param  blurRadius
//!         The radius of the blur in points.
//! @param  tintColor
//!         An optional UIColor object that is uniformly blended with the
//!         result of the blur and saturation operations.  The alpha channel
//!         of this color determines how strong the tint is.
//! @param  saturationDeltaFactor
//!         A value of 1.0 produces no change in the resulting image.  Values
//!         less than 1.0 will desaturation the resulting image while values
//!         greater than 1.0 will have the opposite effect.
//! @param  maskImage
//!         If specified, @a inputImage is only modified in the area(s) defined
//!         by this mask.  This must be an image mask or it must meet the
//!         requirements of the mask parameter of CGContextClipToMask.
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
@end
