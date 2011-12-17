//
//  CustomTitleView.h
//  iXBMC
//
//  Created by Martin Guillon on 5/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTitleView : UIButton {
    TTLabel* _titleLabel;
    TTLabel* _subTitleLabel;   
}
@property (nonatomic, retain) TTLabel* titleView;
@property (nonatomic, retain) TTLabel* subtitleView;
@property (nonatomic, retain) NSString* title;
@property (nonatomic, retain) NSString* subtitle;
@property CGFloat yDecale;

- (id)initWithTitle:(NSString *)tt;
- (id)initWithTitle:(NSString *)tt subtitle:(NSString *)sbtt;

@end
