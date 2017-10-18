//
//  HorScorllView.m
//  CustomView
//
//  Created by Arthur on 2017/10/18.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "HorScorllView.h"


#define ImageButtonWidth [UIScreen mainScreen].bounds.size.width / 5

@interface HorScorllView ()

@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, strong) UILabel *textLabel;

@end

@implementation HorScorllView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.frame.size.height)];
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    for (int i = 0; i < 8; i++) {
        self.imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.imageButton.frame = CGRectMake(i * ImageButtonWidth, 0, ImageButtonWidth, ImageButtonWidth);
        self.imageButton.layer.masksToBounds = YES;
        self.imageButton.layer.cornerRadius = ImageButtonWidth / 2;
        [self.imageButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        self.imageButton.tag = i + 100;

        self.imageButton.transform = CGAffineTransformMakeScale(0.78, 0.78);
        [self.imageButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [self.imageButton setBackgroundImage:[UIImage imageNamed:@"bowang"] forState:UIControlStateNormal];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(i * ImageButtonWidth, CGRectGetMaxY(self.imageButton.frame) + 5, ImageButtonWidth, 20)];
        self.textLabel.tag = i + 200;
//        self.textLabel.text = [NSString stringWithFormat:@"博网"];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.font = [UIFont systemFontOfSize:14];
        [scrollView addSubview:self.imageButton];
        [scrollView addSubview:self.textLabel];

    }
    scrollView.contentSize = CGSizeMake(ImageButtonWidth * 8, self.frame.size.height);
}

- (void)setImages:(NSArray *)images {
    _images = images;

    for (int i = 0; i < _images.count; i ++) {
        UIButton *imageButton = (UIButton *)[self viewWithTag:i + 100];
        [imageButton xr_setButtonImageWithUrl:_images[i]];
    }
    
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    
    for (int i = 0; i < _titles.count; i ++) {
        UILabel *textLabel = [self viewWithTag:i + 200];
        textLabel.text = _titles[i];
    }
    
}

- (void)clickAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(horImageClickAction:)]) {
        [self.delegate horImageClickAction:button.tag];
    }
}




@end
