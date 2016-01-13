//
//  VDFileHelper.m
//  vdLib
//
//  Created by xiaobing on 14-9-25.
//  Copyright (c) 2014年 sina. All rights reserved.
//

#import "XXBFileHelper.h"
#import <sys/xattr.h>
#import <sys/stat.h>
#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch]!=NSOrderedAscending)
@implementation XXBFileHelper

+ (BOOL)createFolder:(NSString *)folderPath{
    return [self createFolder:folderPath iCloudEnable:NO];
}

+ (BOOL)createFolder:(NSString *)folderPath iCloudEnable:(BOOL)iCloudEnable
{
    if ([[NSFileManager defaultManager] fileExistsAtPath:folderPath]) {
        return YES;
    }
    
    if ([[NSFileManager defaultManager] createDirectoryAtPath:folderPath
                                  withIntermediateDirectories:YES
                                                   attributes:nil error:nil]) {
        [self iCloudEnable:iCloudEnable atPath:folderPath];
        return YES;
    }
    
    return NO;
}

+ (NSString *)getFullPathWithRootPath:(NSString *)rootPath extendPath:(NSString *)extendPath fileName:(NSString *)fileName
{
    NSString *path = [rootPath stringByAppendingPathComponent:extendPath];
    [self createFolder:path];
    return [path stringByAppendingPathComponent:fileName];
}


+ (BOOL)iCloudEnable:(BOOL)iCloudEnable atPath:(NSString *)path
{
    BOOL skip  = ! iCloudEnable;
    NSURL *url = [NSURL fileURLWithPath:path];
    
    BOOL success = NO;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.1"))
    {
#ifndef NSURLIsExcludedFromBackupKey
#define NSURLIsExcludedFromBackupKey @"NSURLIsExcludedFromBackupKey"
#endif
        NSError *error = nil;
        success = [url setResourceValue:[NSNumber numberWithBool:skip]
                                 forKey:NSURLIsExcludedFromBackupKey
                                  error:&error];
    }
    else if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0.1"))
    {
        const char* filePath = [[url path] fileSystemRepresentation];
        const char* attrName = "com.apple.MobileBackup";
        u_int8_t attrValue = skip;
        int result = setxattr(filePath, attrName, &attrValue, sizeof(attrValue), 0, 0);
        success = (result == 0) ? YES : NO;
    }
    
    return success;
}

+ (unsigned long long)getFileSize:(NSString*)filePath
{
    NSDictionary *attributes = [[NSFileManager defaultManager]
                                attributesOfItemAtPath:filePath error:nil];
    return (unsigned long long)[[attributes objectForKey:NSFileSize] unsignedLongLongValue];
}

+ (unsigned long long)getFileSystemFreeSize
{
    NSDictionary *fattributes = [[NSFileManager defaultManager]
                                 attributesOfFileSystemForPath:NSHomeDirectory()
                                 error:NULL];
    return [[fattributes objectForKey:NSFileSystemFreeSize] unsignedLongLongValue];
}

+ (unsigned long long)getFileSystemTotalSize
{
    NSDictionary *fattributes = [[NSFileManager defaultManager]
                                 attributesOfFileSystemForPath:NSHomeDirectory()
                                 error:NULL];
    return [[fattributes objectForKey:NSFileSystemSize] unsignedLongLongValue];
}

+ (unsigned long long)getFolderSize:(NSString*)folderPath
{
    unsigned long long filesz = 0;
    NSFileManager* fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:folderPath]) {
        return 0;
    }
    NSEnumerator *childFilesEnumerator = [[fm subpathsAtPath:folderPath]
                                          objectEnumerator];
    NSString* fileName;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        filesz += [self fileSizeAtPath:fileAbsolutePath];
    }
    return filesz;
}

+ (unsigned long long)fileSizeAtPath:(NSString*)filePath
{
    struct stat st;
    if (lstat([filePath cStringUsingEncoding:NSUTF8StringEncoding], &st) == 0)
    {
        return st.st_size;
    }
    return 0;
}

+ (NSString *)findFile:(NSString *)rootPath fileName:(NSString *)fileName
{
    NSError *error;
    NSArray *pathList = [[NSFileManager defaultManager]
                         contentsOfDirectoryAtPath:rootPath error:&error];
    
    for (NSString *t_path in pathList)
    {
        NSString * fullPath = [rootPath stringByAppendingPathComponent:t_path];
        BOOL isDir;
        if ([[NSFileManager defaultManager]
             fileExistsAtPath:fullPath isDirectory:&isDir])
        {
            if (isDir)
            {
                if ([self findFile:fullPath fileName:fileName] != nil)
                {
                    return [fullPath stringByAppendingPathComponent:fileName];
                }
            }
            else
            {
                if ([t_path isEqualToString:fileName])
                {
                    return t_path;
                }
            }
        }
    }
    return nil;
}

+ (void)removeAllFileAtPath:(NSString*)folderPath
{
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName = nil;
    while ((fileName = [childFilesEnumerator nextObject]) != nil)
    {
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        [manager removeItemAtPath:fileAbsolutePath error:nil];
    }
}
@end
