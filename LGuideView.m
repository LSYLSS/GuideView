//
//  LGuideView.m
//  CodeTest
//
//  Created by lss on 2018/5/26.
//  Copyright © 2018年 CodeTest. All rights reserved.
//

#import "LGuideView.h"


@implementation LGuideView

+(instancetype)showGuidViewWithTargetViews:(UIView*)view andText:(NSString*)title removeByTap:(BOOL)isRemove
{
    LGuideView *guideView = [[LGuideView alloc] init];
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    guideView.frame = window.bounds;
    guideView.userInteractionEnabled = true;
    guideView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];

    if (isRemove==true) {
        [guideView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:guideView action:@selector(removeAll:)]];
    }
    UILabel *tips = [[UILabel alloc] init];
    tips.frame=CGRectMake(0,CGRectGetMaxY(view.frame)+CGRectGetHeight(view.frame), CGRectGetWidth(guideView.frame), 80);
    tips.numberOfLines = 0;
    tips.textColor = [UIColor whiteColor];
    tips.text = title;
    tips.textAlignment = NSTextAlignmentCenter;
    tips.adjustsFontSizeToFitWidth = true;
    [guideView addSubview:tips];
    
    UIBezierPath *bpath = [UIBezierPath bezierPathWithRect:guideView.bounds];
    [bpath appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(view.frame.origin.x, view.bounds.size.height+view.frame.origin.y, view.bounds.size.width, view.bounds.size.height) cornerRadius:5.0f]bezierPathByReversingPath]];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bpath.CGPath;
    guideView.layer.mask = shapeLayer;
    
    [window addSubview:guideView];
    [window bringSubviewToFront:guideView];
    
    return guideView;
}
-(void)removeAll:(UITapGestureRecognizer*)tap
{
    [tap.view removeFromSuperview];
}
@end
