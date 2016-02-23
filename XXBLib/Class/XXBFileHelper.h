
/*!
 @header       XXBFileHelper.h
 @abstract     只提供复杂的文件操作，简单的操作直接使用NSFileManager
 @author       xiaobing3@staff.sina.com.cn
 */

#import <Foundation/Foundation.h>

@interface XXBFileHelper : NSObject

/*!
 创建文件夹
 @param folderPath 路径
 @return 创建结果
 */
+ (BOOL)createFolder:(NSString *)folderPath;

/*!
 创建文件夹并设置iCloud属性
 @param folderPath      路径
 @param iCloudEnable    iCloud属性
 @return                创建结果
 */
+ (BOOL)createFolder:(NSString *)folderPath iCloudEnable:(BOOL)iCloudEnable;

/*!
 设置文件iCloud属性
 @param enable      iCloud属性
 @param path        路径
 @return            创建结果
 */
+ (BOOL)iCloudEnable:(BOOL)enable atPath:(NSString *)path;

/*!
 根据路径、文件名获得指定文件路径 如没有则创建
 @param rootPath   根路径 document、library、temp、cache等
 @param extendPath 延展路径
 @param fileName   文件名
 @return 指定文件路径
 */
+ (NSString *)getFullPathWithRootPath:(NSString *)rootPath extendPath:(NSString *)extendPath fileName:(NSString *)fileName;

/*!
 获取文件大小
 @param filePath    路径
 @return            文件大小
 */
+ (unsigned long long)getFileSize:(NSString*)filePath;

/*!
 获取剩余空间大小
 @return 剩余空间大小
 */
+ (unsigned long long)getFileSystemFreeSize;

/*!
 获取总空间大小
 @return 总空间大小
 */
+ (unsigned long long)getFileSystemTotalSize;

/*!
 获取文件夹大小
 @param folderPath  路径
 @return            文件夹大小
 */
+ (unsigned long long)getFolderSize:(NSString*)folderPath;

/*!
 查找文件
 @param rootPath    查找路径
 @param fileName    文件名
 @return            文件路径
 */
+ (NSString *)findFile:(NSString *)rootPath fileName:(NSString *)fileName;

/*!
 清空指定文件夹
 @param folderPath  需清空文件夹
 */
+ (void)removeAllFileAtPath:(NSString*)folderPath;
@end