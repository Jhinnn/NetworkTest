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
#import "HorScorllView.h"
@interface ViewController () <HorScorllViewImageClickDelegate>

@end

@implementation ViewController  {
    NSMutableArray *_homeImageArray;
    NSMutableArray *_homeTitleArray;
    
    HorScorllView *_horScorllView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];

    [self loadNetworkData];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setupUI {
    
     _horScorllView = [[HorScorllView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, [UIScreen mainScreen].bounds.size.width, 100)];
    _horScorllView.delegate = self;
    [self.view addSubview:_horScorllView];
    
}

- (void)loadNetworkData {
        
    _homeImageArray = @[].mutableCopy;
    _homeTitleArray = @[].mutableCopy;
    
    HomeNetApi *api = [[HomeNetApi alloc] initWithVid:@""];
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSLog(@"%@",request.responseObject);
        for (NSDictionary *dic in request.responseObject[@"result"]) {
//            HomeImagesModel *model = [[HomeImagesModel alloc] initWithDataDic:dic];
            [_homeImageArray addObject:dic[@"path"]];
            [_homeTitleArray addObject:dic[@"name"]];
            
        }
        
        _horScorllView.titles = _homeTitleArray;
        _horScorllView.images = _homeImageArray;
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        
    }];
}

- (void)horImageClickAction:(NSInteger)tag {
    NSLog(@"你点击的按钮tag值为：%ld",tag);
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
