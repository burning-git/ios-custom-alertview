//
//  AlterViewMultiple.h
//  CustomIOSAlertView
//
//  Created by gitBurning on 15/11/28.
//  Copyright © 2015年 Wimagguc. All rights reserved.
//

#import "CustomIOSAlertView.h"
@class AlterViewMultipleObject;

/*!
 *  @brief  AlterViewMultiple样式
 */
typedef NS_ENUM(NSUInteger, kAlterViewMultipleType) {
    /*!
     *  默认样式
     */
    AlterViewMultiple_System
};

@interface AlterViewMultiple : CustomIOSAlertView

-(instancetype)initAlterWithValues:(AlterViewMultipleObject *)values selectBlcok:(void (^)(CustomIOSAlertView *alertView, int buttonIndex))selectBlcok;

/*!
 *  @brief  增加底部分割线
 */
-(void)addSeparators;
@end



@interface AlterViewMultipleObject : NSObject
@property(assign,nonatomic) kAlterViewMultipleType alterType;

@property (copy,nonatomic) NSString * title;
@property (copy,nonatomic) NSString * message;

@property (strong,nonatomic) NSArray * buttons;
@property (assign,nonatomic) float messageWidth;
@property (assign,nonatomic) float alterWidth;

@end