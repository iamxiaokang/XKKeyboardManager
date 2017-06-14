//
//  ViewController.m
//  XKKeyboardManagerDemo
//
//  Created by liping kang on 2017/6/14.
//  Copyright © 2017年 liping kang. All rights reserved.
//

#import "ViewController.h"
#import "XKKeyboardManager.h"
#define MARGIN_KEYBOARD 10
@interface ViewController () <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *textField1;
@property (nonatomic,strong) UITextField *textField2;
@property (nonatomic,strong) UITextField *textField3;
@property (nonatomic,strong) UIView *xkInputView;

@property (strong, nonatomic) XKKeyboardManager *keyboardManager;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupUI];
	 [self configKeyBoardRespond];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)configKeyBoardRespond{
	self.keyboardManager = [[XKKeyboardManager alloc] initWithKeyboardTopMargin:MARGIN_KEYBOARD];
	__weak ViewController *weakSelf = self;
#pragma explain - 全自动键盘弹出/收起处理 (需调用keyboardUtil 的 adaptiveViewHandleWithController:adaptiveView:)
#pragma explain - use animateWhenKeyboardAppearBlock, animateWhenKeyboardAppearAutomaticAnimBlock will be invalid.
	
	[_keyboardManager setAnimateWhenKeyboardAppearAutomaticAnimBlock:^(XKKeyboardManager *keyboardManager) {
		[keyboardManager adaptiveViewHandleWithAdaptiveView:weakSelf.xkInputView,weakSelf.textField2,weakSelf.textField3, nil];
	}];

}
- (void)setupUI{
	[self.view addSubview:self.xkInputView];
	[self.xkInputView addSubview:self.textField1];
	[self.view addSubview:self.textField2];
	[self.view addSubview:self.textField3];
}

- (UIView *)xkInputView{
	if (!_xkInputView) {
		_xkInputView = [UIView new];
		_xkInputView.frame = CGRectMake(self.view.frame.size.width/2 - 100, self.view.frame.size.height - 200, 200, 50);
		_xkInputView.backgroundColor = [UIColor orangeColor];
	}
	return _xkInputView;
}
- (UITextField *)textField1{
	if (!_textField1) {
		_textField1 = [[UITextField alloc] init];
		_textField1.delegate = self;
		_textField1.placeholder = @"点我输入内容";
		_textField1.frame = CGRectMake(25, 10, 150, 30);
		_textField1.backgroundColor = [UIColor yellowColor];
	}
	return _textField1;
}

- (UITextField *)textField2{
	if (!_textField2) {
		_textField2 = [[UITextField alloc] init];
		_textField2.delegate = self;
		_textField2.frame = CGRectMake(self.view.frame.size.width/2 - 75, CGRectGetMaxY(self.xkInputView.frame) + 10, 150, 30);
		_textField2.placeholder = @"点我输入内容";
		_textField2.backgroundColor = [UIColor yellowColor];
	}
	return _textField2;
}

- (UITextField *)textField3{
	if (!_textField3) {
		_textField3 = [[UITextField alloc] init];
		_textField3.delegate = self;
		_textField3.frame = CGRectMake(self.view.frame.size.width/2 - 75, CGRectGetMaxY(self.textField2.frame) + 10, 150, 30);
		_textField3.placeholder = @"点我输入内容";
		_textField3.backgroundColor = [UIColor yellowColor];
	}
	return _textField3;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}
#pragma mark delegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self.textField1 resignFirstResponder];
	[self.textField2 resignFirstResponder];
	[self.textField3 resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[self.textField1 resignFirstResponder];
	[self.textField2 resignFirstResponder];
	[self.textField3 resignFirstResponder];
	
	return YES;
}


@end
