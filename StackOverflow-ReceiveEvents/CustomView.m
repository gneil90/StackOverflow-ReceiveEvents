//
//  CustomView.m
//  StackOverflow-ReceiveEvents
//
//  Created by Yan Saraev on 4/7/14.
//  Copyright (c) 2014 NeilGaliaskarov. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
	if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
		for (UIView *subview in self.subviews.reverseObjectEnumerator) {
			CGPoint subPoint = [subview convertPoint:point fromView:self];
			UIView *result = [subview hitTest:subPoint withEvent:event];
			if (result != nil && [result isKindOfClass:[UIButton class]]) {
				return result;
				break;
			}
		}
	}

	return [super hitTest:point withEvent:event];
}

@end
