//
//  ZQKTip.h
//  TestPath
//
//  Created by xixi on 16/4/21.
//  Copyright © 2016年 xixi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZQKTip : UIView

@property (nonatomic, assign) CGFloat lineWidth; /**<边框宽度*/
@property (nonatomic, strong) NSArray *lineColor; /**<边框颜色*/

@property (nonatomic, strong) CAShapeLayer *progressLayer; /**<进度条*/

- (instancetype)initWithFrame:(CGRect)frame andLineWidth:(CGFloat)lineWidth andLineColor:(NSArray *)lineColor;

-(void) show;
-(void) setYes;
-(void) setError;


@end
