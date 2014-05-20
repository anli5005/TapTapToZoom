//
//  A5005TapTapView.m
//  Tap Tap To Zoom
//
//  Created by Anthony Li on 5/18/2014.
//  Copyright (c) 2014 anli5005. All rights reserved.
//

#import "A5005TapTapView.h"
#import "A5005TapTapLayer.h"

@implementation A5005TapTapView

- (void)awakeFromNib {
    self.layer = [[A5005TapTapLayer alloc] init];
    self.layer.frame = self.frame;
    self.wantsLayer = YES;
    A5005TapTapLayer *l = (A5005TapTapLayer *)self.layer;
    l.score = 257;
    [self.layer display];
}

@end
