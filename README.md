# QBBaseTabBarCL
搭建一个包含启动轮询图和TabBar的框架

----
#如何使用
+  在AppDelegate中导入头文件 
   - "#import "QBTabBarController.h"
   - "#import "QBIntroductoryPagesHelper.h"
   
+ 启动方法中设置"QBTabBarController"到window视图，并将控制放入数组中,随后跟着启动图配置
   ```objc
  - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    QBTabBarController *tabbar = [[QBTabBarController alloc] init];
    [tabbar addControllerArr:@[@"ViewController",@"ViewController",@"ViewController"]];
    self.window.rootViewController = tabbar;
    
    // 欢迎视图
    [QBIntroductoryPagesHelper showIntroductoryPageView:@[@"default_1.png", @"default_2.png", @"default_3.png"]];
    return YES;
   }
  ```
 + window属性配置
   ```objc
   - (UIWindow *)window
    {
    if(!_window){
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
    }
  ```
  
  ### 参考链接:https://github.com/NJHu/iOSProject

    


   
