//
//  XXBNetworkServers.m
//  XXBLibDemo
//
//  Created by xiaobing on 16/1/6.
//  Copyright © 2016年 杨小兵. All rights reserved.
//

#import "XXBNetworkServers.h"
#import "Reachability.h"

NSString * const SNBNetWorkStateChange = @"SNBNetWorkStateChange";

@interface XXBNetworkServers ()
@property(nonatomic , strong) Reachability  *reachability;
@property(nonatomic , assign) BOOL          serversRuning;
@end

@implementation XXBNetworkServers
XXBSingletonM(XXBNetworkServers);

- (instancetype)init
{
    if (self = [super init])
    {
        _netWorkState = (XXBNetworkState)[self.reachability currentReachabilityStatus];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
        self.serversRuning = YES;
    }
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)startServers
{
    self.serversRuning = [self.reachability startNotifier];
}
- (void)stopServers
{
    [self.reachability stopNotifier];
    self.serversRuning = NO;
}
- (BOOL)isServersRun
{
    return self.serversRuning;
}


- (Reachability *)reachability
{
    if (_reachability == nil)
    {
        _reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
        [_reachability startNotifier];
    }
    return _reachability;
}


- (void) reachabilityChanged: (NSNotification* )note
{
    Reachability* curReach = [note object];
    if (curReach != self.reachability) {
        return;
    }
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    XXBNetworkState networkState = (XXBNetworkState)[curReach currentReachabilityStatus];

//    XXBNetworkState networkState = XXBNetworkNone;
//    NetworkStatus nowNetworkState = [curReach currentReachabilityStatus];
//    switch (nowNetworkState)
//    {
//        case NotReachable:
//        {
//            networkState = XXBNetworkNone;
//            break;
//        }
//        case ReachableViaWWAN:
//        {
//            networkState = XXBNetworkWWAN;
//            break;
//        }
//        case ReachableViaWiFi:
//        {
//            networkState = XXBNetworkWiFi;
//            break;
//        }
//        default:
//            NSAssert(NO, @"未知Reachable");
//            break;
//    }
    
    if (_netWorkState != networkState)
    {
        _netWorkState = networkState;
        [[NSNotificationCenter defaultCenter] postNotificationName:SNBNetWorkStateChange object:[NSNumber numberWithLong:_netWorkState]];
    }
}

@end
