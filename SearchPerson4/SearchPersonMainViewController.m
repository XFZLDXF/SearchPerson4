//
//  SearchPersonMainViewController.m
//  SearchPerson4
//
//  Created by DolBy on 13-5-4.
//  Copyright (c) 2013年 Duxinfeng. All rights reserved.
//

#import "SearchPersonMainViewController.h"
#import "Reachability.h"
#import "Config.h"
#import "AFSPClient.h"
@interface SearchPersonMainViewController ()


@end

@implementation SearchPersonMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.tintColor = BG_COLOR;
    
//    网络检测
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    reach.reachableBlock = ^(Reachability *reachability){
        dispatch_async(dispatch_get_main_queue(), ^{
            debugLog(@"网络联通，正在加载数据，解析最新数据");
            [Config instance].isNetWorking = YES;
    [MBHUDView hudWithBody:@"呵呵 网络已通" type:MBAlertViewHUDTypeCheckmark hidesAfter:1.0 show:YES];
        });
    };
    reach.unreachableBlock = ^(Reachability *reachability){
        dispatch_async(dispatch_get_main_queue(), ^{
            debugLog(@"提示信息");
    [Config instance].isNetWorking = NO;
//  MBAlertView 提示动画
    [MBHUDView hudWithBody:@"哎呀 网络不给力!" type:MBAlertViewHUDTypeExclamationMark hidesAfter:1.0 show:YES];
        });
    };
    [reach startNotifier];
    
 
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
