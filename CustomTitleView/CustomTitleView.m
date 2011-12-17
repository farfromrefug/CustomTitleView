//
//  CustomTitleView.m
//  iXBMC
//
//  Created by Martin Guillon on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomTitleView.h"


@implementation CustomTitleView
@synthesize title;
@synthesize subtitle;
@synthesize titleView = _titleLabel;
@synthesize subtitleView = _subTitleLabel;
@synthesize yDecale;

- (id)initWithTitle:(NSString *)tt {
    if (self = [self init]) 
    {
        [self setTitle:tt];
    }
    return self;
}

- (id)initWithTitle:(NSString *)tt subtitle:(NSString *)sbtt{
    if (self = [self init]) 
    {
        [self setTitle:tt];
        [self setSubtitle:sbtt];
    }
    return self;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
UIInterfaceOrientation InterfaceOrientation() {
    UIInterfaceOrientation orient = [UIApplication sharedApplication].statusBarOrientation;
    return orient;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect ScreenBounds() {
    CGRect bounds = [UIScreen mainScreen].bounds;
    if (UIInterfaceOrientationIsLandscape(TTInterfaceOrientation())) {
        CGFloat width = bounds.size.width;
        bounds.size.width = bounds.size.height;
        bounds.size.height = width;
    }
    return bounds;
}

- (id)init {
    if (self = [super init]) 
    {
        self.yDecale = 0;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
        | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = TRUE;
        
        _titleLabel = [[[NIAttributedLabel alloc] init] autorelease];
//        _titleLabel.style = TTSTYLE(customNavTitleTitle);
//        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _titleLabel.backgroundColor = [UIColor clearColor];
//        _titleLabel.contentMode = UIViewContentModeScaleToFill;
        _titleLabel.userInteractionEnabled = FALSE;
        
        _subTitleLabel = [[[NIAttributedLabel alloc] init] autorelease];
//        _subTitleLabel.style = TTSTYLE(customNavTitleSubtitle);
//        _subTitleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _subTitleLabel.backgroundColor = [UIColor clearColor]; 
//        _subTitleLabel.contentMode = UIViewContentModeBottom;
        _subTitleLabel.userInteractionEnabled = FALSE;
        
        [self addSubview:_titleLabel]; 
        [self addSubview:_subTitleLabel]; 
        
        self.frame = CGRectMake(0, 0, ScreenBounds().size.width, UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])?32:40);
        _titleLabel.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/2);
        _subTitleLabel.frame = CGRectMake(0, self.bounds.size.height/2
                                          , self.bounds.size.width, self.bounds.size.height/2);
    }
    return self;
}

-(NSString *) title
{
    return _titleLabel.text;
}

-(void) setTitle:(NSString *)value
{
    _titleLabel.text = value;
}

-(NSString *) subtitle
{
    return _subTitleLabel.text;
}

-(void) setSubtitle:(NSString *)value
{
    _subTitleLabel.text = value;
}

-(void) setFrame:(CGRect)frame
{
    [super setFrame:frame];
//    CGRect superframe = self.superview.frame;

}

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = [self.subtitle length] > 0 ? self.height /2 : self.height;
    int decaleLeft = self.frame.origin.x;
    int decaleRight = self.superview.width - self.frame.origin.x - self.frame.size.width;
    int decale = MAX(decaleRight, decaleLeft);
    CGRect realFrame = CGRectMake(decale, self.frame.origin.y, self.superview.width - 2*decale, self.superview.height);
    
    _titleLabel.frame = CGRectMake(realFrame.origin.x - self.frame.origin.x, self.yDecale
                                   , realFrame.size.width
                                   , height - self.yDecale);
    _subTitleLabel.frame = CGRectMake(_titleLabel.left, self.height - height + self.yDecale
                                      , _titleLabel.width, height - self.yDecale);
}
@end
