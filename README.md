# XKKeyboardManager

在我们开发中，经常会用到输入框输入文本，有的时候键盘会挡住我们的输入框，每次去写比较麻烦，我就写了一个处理挡住键盘的问题。

### 如何使用
   	#import "XKKeyboardManager.h"
	@property (strong, nonatomic) XKKeyboardManager *keyboardManager;
  	__weak ViewController *weakSelf = self;
	[_keyboardManager setAnimateWhenKeyboardAppearAutomaticAnimBlock:^(XKKeyboardManager *keyboardManager) {
		[keyboardManager adaptiveViewHandleWithAdaptiveView:weakSelf.view1,weakSelf.view2,weakSelf.view3,...., nil];
	}];

具体使用可以看demo。
