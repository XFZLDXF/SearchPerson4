//
//  SearchViewController.m
//  SearchPerson4
//
//  Created by DolBy on 13-5-4.
//  Copyright (c) 2013年 Duxinfeng. All rights reserved.
//

#import "SearchViewController.h"
#import "PersonInfo.h"
#import "AFSPClient.h"
#import "Config.h"
#define BAIDU_SEARCHPERSON_SEARCH_API @"http://opendata.baidu.com/api.php?resource_id=6109&format=xml&ie=utf-8&oe=utf-8&query="
@interface SearchViewController ()

@end

@implementation SearchViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.searchBar.tintColor = BG_COLOR;
    [self.searchBar becomeFirstResponder];
    self.searchBar.showsCancelButton=YES;

}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.searchBar.showsCancelButton=YES;
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    debugMethod();
    [self.searchBar resignFirstResponder];
    self.searchBar.showsCancelButton=NO;

}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
   
    debugMethod();
    if (self.searchBar.text.length == 0) {
        [MBHUDView hudWithBody:@"输入为空噢!" type:MBAlertViewHUDTypeActivityIndicator hidesAfter:0.75 show:YES];
        return;
    }
    [self.searchBar resignFirstResponder];
    self.searchBar.showsCancelButton=NO;
    [self clear];
    [self doSearch];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doSearch
{
//   http://webservice.webxml.com.cn/WebServices/WeatherWS.asmx/getRegionProvince
    isLoading = YES;
    if ([Config instance].isNetWorking) {
        debugLog(@"网络 %d",[Config instance].isNetWorking);
        int pageIndex = allCount/20;
      
        NSString *url = [NSString stringWithFormat:@"%@%@&from_mid=1&rn=%d&pn=%d",BAIDU_SEARCHPERSON_SEARCH_API,[self encodeToPercentEscapeString:self.searchBar.text],20,pageIndex];
        
        [[AFSPClient sharedInstance] postPath:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            debugLog(@"加载成功");
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            debugLog(@"加载出错,请检查网络");
        }];
        
       
                             
    }
          
}

-(void)clear
{

}

//UTF8  转码
-(NSString *)encodeToPercentEscapeString:(NSString *)input
{
    NSString *outputStr = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)input, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
    return outputStr;
}

#pragma mark -
#pragma mark UITableViewDelegate Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentify =@"Cell";
}

@end
