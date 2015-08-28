//
//  ViewController.m
//  XXBLibDemo
//
//  Created by 杨小兵 on 15/8/24.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import "ViewController.h"
#import "XXBLibs.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self NSDataHelpTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)NSDataHelpTest
{
    
    NSString *string = @"test";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    data = [data AES256ParmEncryptWithKey:@"key"];
    NSLog(@"加密 --》 %@",data);
    data = [data AES256ParmDecryptWithKey:@"key"];
    NSLog(@"解密 --》 %@",    [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
          );
}
@end
