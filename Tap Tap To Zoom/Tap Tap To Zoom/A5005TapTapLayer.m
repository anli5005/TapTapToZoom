//
//  A5005TapTapLayer.m
//  Tap Tap To Zoom
//
//  Created by Anthony Li on 5/18/2014.
//  Copyright (c) 2014 anli5005. All rights reserved.
//

#import "A5005TapTapLayer.h"

@implementation A5005TapTapLayer

- (id)init {
    if (self = [super init]) {
        self.contentsGravity = kCAGravityResizeAspect;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx {
    CGContextSetFillColorWithColor(ctx, CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0));
    CGContextFillRect(ctx, self.frame);
    
    CGRect scoreRect = CGRectMake(self.frame.origin.x, (CGRectGetMaxY(self.frame) - 50) + 0.5, self.frame.size.width, 50);
    CGContextSetFillColorWithColor(ctx, CGColorCreateGenericRGB(0.0, 0.0, 0.0, 0.5));
    CGContextFillRect(ctx, scoreRect);
    
    CGContextSetFillColorWithColor(ctx, CGColorCreateGenericRGB(1.0, 1.0, 1.0, 1.0));
    
    CGPathRef path = CGPathCreateWithRect(scoreRect, NULL);
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld", self.score] attributes:@{NSFontAttributeName: [NSFont fontWithName:@"Helvetica Neue Light" size:37], NSForegroundColorAttributeName: [NSColor whiteColor]}];
    CTFramesetterRef f = CTFramesetterCreateWithAttributedString((__bridge CFTypeRef)str);
    CTFrameRef frame = CTFramesetterCreateFrame(f, CFRangeMake(0, CFAttributedStringGetLength((__bridge CFTypeRef)str)), path, NULL);
    CTFrameDraw(frame, ctx);
    
    CFRelease(frame);
    CFRelease(f);
    CGPathRelease(path);
    
    NSInteger level = (self.score - (self.score % 100)) / 100;
    NSInteger scoreFromLevel = self.score % 100;
    NSLog(@"%ld, Level %ld", scoreFromLevel, level);
}

@end
