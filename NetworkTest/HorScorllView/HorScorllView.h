//
//  HorScorllView.h
//  CustomView
//
//  Created by Arthur on 2017/10/18.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorScorllViewImageClickDelegate <NSObject>

- (void)horImageClickAction:(NSInteger)tag;

@end

@interface HorScorllView : UIView

@property (nonatomic, strong) NSArray *images;  /**图片*/

@property (nonatomic, strong) NSArray *titles;  /**标题*/

@property (nonatomic, weak) __weak id<HorScorllViewImageClickDelegate> delegate;


@end
