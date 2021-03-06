//
//  ViewController.m
//  XXBLibDemo
//
//  Created by 杨小兵 on 15/8/24.
//  Copyright (c) 2015年 杨小兵. All rights reserved.
//

#import "ViewController.h"
#import <XXBLibs/XXBLibs.h>
#import <XXBLibs/XXBLibsCategory.h>
#import <WebKit/WebKit.h>

#define XXBMin(a,b) a >= b ? b : a

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView                 *testView;
@property (weak, nonatomic) IBOutlet UIImageView            *iconView;
@property (weak, nonatomic) IBOutlet XXBTextField           *inputTextField;

@property(nonatomic, strong) NSMutableDictionary            *crashDictionary;


- (IBAction)saveMessage:(id)sender;
- (IBAction)loadMessage:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
        });
    });
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    NSLog(@"hello" @"word");
    XXBLog(@"hellp");
    //    XXBLog(@"%@+++++++++++++++",@(XXBMin(1, 2)));
    NSLog((@"%s [Line %d] " @"%@"), __PRETTY_FUNCTION__, __LINE__,@"name");
    // Do any additional setup after loading the view, typically from a nib.
    [self NSDataHelpTest];
    [self UIViewMotionEffectTest];
    [self netWorkTest];
    [self urlTest];
    [[XXBNetworkServers sharedXXBNetworkServers] startServers];
    self.inputTextField.maxTextCount = 7;
    
    [self testFPSLabel];
    
    if(isNull(nil)) {
        NSLog(@"测试 NULL & nil");
    }
    
    int(^ sum)(int a, int b) = ^(int a,int b) {
        NSLog(@"XXB | %@ %d",[NSThread currentThread],a + b);
        return  a + b;
    };
    __block int  a = 0;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        a = XXB_BLOCK(sum,1,3);
        XXB_SAFE_BLOCK(sum,1,4);
    });
    XXB_BLOCK(sum,1,5);
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)openWebView {
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)XXBDeviceHelpTest {
    [XXBDeviceHelp oldDeviceId];
}

- (void)NSDataHelpTest {
    
    NSString *string = @"test";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    data = [data AES256ParmEncryptWithKey:@"key"];
    NSLog(@"加密 --》 %@",data);
    data = [data AES256ParmDecryptWithKey:@"key"];
    NSLog(@"解密 --》 %@",    [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
          );
}
- (void)UIViewMotionEffectTest {
    CGFloat xMove = 100;
    CGFloat yMove = 100;
    self.testView.effectGroup = [UIMotionEffectGroup new];
    [self.testView addXAxisWithValue:xMove YAxisWithValue:yMove];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    [self.iconView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"icon"] afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if (CGRectContainsPoint(self.testView.frame, point)) {
        self.testView.clipsToBounds = YES;
        [self.testView addAnimationAtPoint:[touch locationInView:self.testView] WithType:aniMationOpen withColor:[UIColor myRandomColor] completion:nil];
    } else {
        [self.view addAnimationAtPoint:point WithType:aniMationClose withColor:[UIColor myRandomColor] completion:nil];
    }
    
    getAllFunction_XXB([WKBackForwardList class]);
    [self testCrash];
}

- (void)netWorkTest {
    NSLog(@"%@ ---> %@ %@" ,[XXBNetWorkExtion getMobileOperatorsName], @([XXBNetWorkExtion getNetworkTypeFromStatusBar]),@([XXBNetWorkExtion isConnectedToNetwork]));
}

- (void)urlTest {
    NSLog(@"%@",[@"https://www.baidu.com/s?wd=%E6%B5%8B%E8%AF%95%E4%B8%AD%E6%96%87&rsv_spt=1&rsv_iqid=0x8097238100000443&issp=1&f=8&rsv_bp=0&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_enter=1&rsv_sug3=16&rsv_sug1=12&rsv_sug2=0&inputT=4161&rsv_sug4=4786" URLDecode]);
    NSString *string = @"https://www.baidu.com/s?wd=我测试中文";
    NSLog(@"%@",[string URLEncode]);
    NSLog(@"%@",[string URLDecode]);
}

- (void)testFPSLabel {
    XXBFPSLabel *fpsLabel = [[XXBFPSLabel alloc] initWithFrame:CGRectMake(0, 80, 100, 44)];
    [self.view addSubview:fpsLabel];
}

- (IBAction)saveMessage:(id)sender {
    NSMutableDictionary *usernamepasswordKVPairs = [NSMutableDictionary dictionary];
    [usernamepasswordKVPairs setObject:@[@"mPassWord",@"mPassWord"] forKey:@"PassWord"];
    [usernamepasswordKVPairs setObject:@[@"mUserName",@"mUserName"] forKey:@"UserName"];
    [[XXBKeyChain sharedXXBKeyChain] save:@"XXBKeyChain" data:usernamepasswordKVPairs];
}

- (IBAction)loadMessage:(id)sender {
    
    NSMutableDictionary *usernamepasswordKVPairs = [[XXBKeyChain sharedXXBKeyChain] load:@"XXBKeyChain"];
    NSLog(@"%@",usernamepasswordKVPairs);
}

- (void)testCrash {
    for (int i = 0; i < 1000; i++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            @synchronized(self){
                [self.crashDictionary setObject:@"VALUE" forKey:@"KEY"];
                self.crashDictionary = nil;
            }
        });
    }
}

- (NSMutableDictionary *)crashDictionary {
    if (_crashDictionary == nil) {
        NSMutableDictionary *crashDictionary = [NSMutableDictionary dictionary];
        _crashDictionary = crashDictionary;
    }
    return _crashDictionary;
}
@end
