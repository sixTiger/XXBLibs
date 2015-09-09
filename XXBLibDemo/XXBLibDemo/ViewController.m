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

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self NSDataHelpTest];
    [self UIViewMotionEffectTest];
    [self netWorkTest];
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
- (void)UIViewMotionEffectTest
{
    CGFloat xMove = 100;
    CGFloat yMove = 100;
    self.testView.effectGroup = [UIMotionEffectGroup new];
    [self.testView addXAxisWithValue:xMove YAxisWithValue:yMove];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.testView.frame, point))
    {
        self.testView.clipsToBounds = YES;
        [self.testView addAnimationAtPoint:[touch locationInView:self.testView] WithType:aniMationOpen withColor:[UIColor myRandomColor] completion:nil];
    }
    else
    {
        [self.view addAnimationAtPoint:point WithType:aniMationClose withColor:[UIColor myRandomColor] completion:nil];
    }
}
- (void)netWorkTest
{
    NSLog(@"%@ ---> %@ %@" ,[XXBNetWorkExtion getMobileOperatorsName], @([XXBNetWorkExtion getNetworkTypeFromStatusBar]),@([XXBNetWorkExtion isConnectedToNetwork]));
}
@end
