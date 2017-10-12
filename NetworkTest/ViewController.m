//
//  ViewController.m
//  NetworkTest
//
//  Created by Arthur on 2017/10/12.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "ViewController.h"
#import "HomeNetApi.h"
#import "HomeImagesModel.h"
#import "LZAutoScrollView.h"
@interface ViewController ()

@end

@implementation ViewController {
    NSMutableArray *_homeImageArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //滚动视图
    LZAutoScrollView *lzAutoScrollView = [[LZAutoScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 220)];
    lzAutoScrollView.pageControlAligment = PageControlAligmentRight;
    lzAutoScrollView.interval = 4;
    [self.view addSubview:lzAutoScrollView];
    
    
    _homeImageArray = @[].mutableCopy;
    
    HomeNetApi *api = [[HomeNetApi alloc] initWithVid:@"403"];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
    
        NSLog(@"%@",request.responseObject);
        for (NSDictionary *dic in request.responseObject[@"result"]) {
//            HomeImagesModel *model = [[HomeImagesModel alloc] initWithDataDic:dic];
//            [_homeImageArray addObject:dic[@"path"]];
        }
        
//        NSLog(@"%@",_homeImageArray);
//        
//        lzAutoScrollView.images = _homeImageArray;
        
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
