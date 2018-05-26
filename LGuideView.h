//
//  LGuideView.h
//  CodeTest
//
//  Created by lss on 2018/5/26.
//  Copyright © 2018年 CodeTest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGuideView : UIView

+(instancetype)showGuidViewWithTargetViews:(UIView*)view andText:(NSString*)title removeByTap:(BOOL)isRemove;

@end
