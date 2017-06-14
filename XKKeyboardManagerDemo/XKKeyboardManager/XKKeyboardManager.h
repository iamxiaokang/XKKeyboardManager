//
//  XKKeyboardManager.h
//  XKKeyboardManagerDemo
//
//  Created by liping kang on 2017/6/14.
//  Copyright © 2017年 liping kang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
static CGFloat const DURATION_ANIMATION = 0.5f;

typedef enum {
	KeyboardActionDefault,
	KeyboardActionShow,
	KeyboardActionHide
}KeyboardAction;

@protocol KeyboardManagerProtocol <NSObject>
- (void)adaptiveViewHandleWithAdaptiveView:(UIView *)adaptiveView, ...NS_REQUIRES_NIL_TERMINATION;
- (void)adaptiveViewHandleWithController:(UIViewController *)viewController adaptiveView:(UIView *)adaptiveView, ...NS_REQUIRES_NIL_TERMINATION;
@end


#pragma mark - KeyboardInfo(model)
@interface KeyboardInfo : NSObject
@property (assign, nonatomic) CGFloat animationDuration;
@property (assign, nonatomic) CGRect frameBegin;
@property (assign, nonatomic) CGRect frameEnd;
@property (assign, nonatomic) CGFloat heightIncrement;
@property (assign, nonatomic) KeyboardAction action;
@property (assign, nonatomic) BOOL isSameAction;

- (void)fillKeyboardInfoWithDuration:(CGFloat)duration frameBegin:(CGRect)frameBegin frameEnd:(CGRect)frameEnd heightIncrement:(CGFloat)heightIncrement action:(KeyboardAction)action isSameAction:(BOOL)isSameAction;
@end

@interface XKKeyboardManager : NSObject <KeyboardManagerProtocol>

//Block
typedef void (^animateWhenKeyboardAppearBlock)(int appearPostIndex, CGRect keyboardRect, CGFloat keyboardHeight, CGFloat keyboardHeightIncrement);
typedef void (^animateWhenKeyboardDisappearBlock)(CGFloat keyboardHeight);
typedef void (^printKeyboardInfoBlock)(XKKeyboardManager *keyboardManager, KeyboardInfo *keyboardInfo);
typedef void (^animateWhenKeyboardAppearAutomaticAnimBlock)(XKKeyboardManager *keyboardManager);

@property (assign, nonatomic) CGFloat keyboardTopMargin;

- (instancetype)initWithKeyboardTopMargin:(CGFloat)keyboardTopMargin;

- (void)setAnimateWhenKeyboardAppearBlock:(animateWhenKeyboardAppearBlock)animateWhenKeyboardAppearBlock;
- (void)setAnimateWhenKeyboardAppearAutomaticAnimBlock:(animateWhenKeyboardAppearAutomaticAnimBlock)animateWhenKeyboardAppearAutomaticAnimBlock;
- (void)setAnimateWhenKeyboardDisappearBlock:(animateWhenKeyboardDisappearBlock)animateWhenKeyboardDisappearBlock;
- (void)setPrintKeyboardInfoBlock:(printKeyboardInfoBlock)printKeyboardInfoBlock;
@end


#pragma mark - UIView+Utils
@interface UIView (Utils)
- (void)findControllerWithResultController:(UIViewController **)resultController;
@end
