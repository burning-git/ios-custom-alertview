//
//  AlterViewMultiple.m
//  CustomIOSAlertView
//
//  Created by gitBurning on 15/11/28.
//  Copyright © 2015年 Wimagguc. All rights reserved.
//

#import "AlterViewMultiple.h"
@interface AlterViewMultiple()
@property(strong,nonatomic) AlterViewMultipleObject * currentValues;
@end

@implementation AlterViewMultiple
-(instancetype)initAlterWithValues:(AlterViewMultipleObject *)values selectBlcok:(void (^)(CustomIOSAlertView *, int))selectBlcok
{
    self = [super init];
    if (self) {
        
        _currentValues = values;
        if (values.alterType == AlterViewMultiple_System ) {
            
           
            NSAssert(values.buttons.count >0, @"至少一个按钮");
            
            [self setContainerView:[self createSubView:values]];
            
            [self setButtonTitles:values.buttons];
            
            [self setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
                if (selectBlcok) {
                    selectBlcok(alertView,buttonIndex);
                }
            }];
            
        }
        
    }
    return self;
}

-(UIView*)createSubView:(AlterViewMultipleObject*)values
{
    UIView * subView = [[UIView alloc] init];
    switch (values.alterType) {
        case AlterViewMultiple_System: {
            {
             subView = [self createSystemSubViewWithTitile:values.title withMessage:values.message withButtons:values.buttons];
            }
            break;
        }
        default: {
            break;
        }
    }
    return subView;
    
}

-(UIView*)createSystemSubViewWithTitile:(NSString*)titile withMessage:(NSString*)message withButtons:(NSArray*)buttons
{
    
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _currentValues.alterWidth, 0)];
    
    float titileHeight = 30;
    float titileY = 10;
    
    
    UILabel * titileLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titileY, _currentValues.alterWidth, titileHeight)];
    titileLabel.textAlignment = NSTextAlignmentCenter;
    titileLabel.text = titile;
    [demoView addSubview:titileLabel];
    
    
    float messageMarginY = 5;
    UITextView * content = [[UITextView alloc] initWithFrame:CGRectMake((_currentValues.alterWidth-_currentValues.messageWidth)/2, CGRectGetHeight(titileLabel.frame)+ messageMarginY, _currentValues.messageWidth, 0)];
    content.text = message;
    
    [content sizeToFit];
    content.backgroundColor = [UIColor clearColor];
    CGRect oldFrame = content.frame;
    oldFrame.size.height = content.contentSize.height;
    content.frame = oldFrame;
    

    [demoView addSubview:content];
    

    
    float messageOffset = 10;
    
    demoView.frame = CGRectMake(0, 0, _currentValues.alterWidth,  CGRectGetMaxY(content.frame) + messageOffset);
    return demoView;
}

-(void)addSeparators
{
    float buttonHeight =  50;//kCustomIOSAlertViewDefaultButtonHeight;
    CGRect superFrame = self.dialogView.frame;
    
   // CGRect valieFrame = CGRectMake(superFrame.origin.x, self.dialogView.frame.size.height - buttonHeight, self.dialogView.frame.size.width, buttonHeight);
    
    NSInteger lines = self.buttonTitles.count-1;
    if (lines>0) {
        float singleWidth = superFrame.size.width / self.buttonTitles.count;
        
        for (NSInteger i=0; i<lines; i++) {
            UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(singleWidth*(i+1), self.dialogView.frame.size.height - buttonHeight, 1, buttonHeight)];
            //lineLabel.backgroundColor = [UIColor greenColor];
            lineLabel.backgroundColor = [UIColor colorWithRed:198.0/255.0 green:198.0/255.0 blue:198.0/255.0 alpha:1.0f];
            [self.dialogView addSubview:lineLabel];
        }
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation AlterViewMultipleObject
-(instancetype)init
{
    self = [super init];
    if (self) {
        
        _alterType = AlterViewMultiple_System;
        _alterWidth = 300;
        _messageWidth = 280;
    }
    return self;
}

@end