//
//  XXBNetworkServers.m
//  XXBLibDemo
//
//  Created by xiaobing on 16/1/6.
//  Copyright © 2016年 杨小兵. All rights reserved.
//

#import "XXBNetworkServers.h"
#import "Reachability.h"

NSString * const XXBNetWorkStateChange = @"XXBNetWorkStateChange";
NSString * const XXBNetWorkState = @"XXBNetWorkState";

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
//#warning if can't get network state quickly  you should chaneg the URLString to a faster URLString 
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
    if (_netWorkState != networkState)
    {
        _netWorkState = networkState;
        [[NSNotificationCenter defaultCenter] postNotificationName:XXBNetWorkStateChange object:[NSNumber numberWithLong:_netWorkState] userInfo:@{
                                                                                                                                                   XXBNetWorkState :@(_netWorkState)
                                                                                                                                                   }];
    }
}

@end
