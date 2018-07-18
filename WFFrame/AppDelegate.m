//
//  AppDelegate.m
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <XHLaunchAd.h>
#import "LaunchAdModel.h"

@interface AppDelegate ()<XHLaunchAdDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    self.window = [UIApplication sharedApplication].delegate.window;
//    [self.window makeKeyAndVisible];
//    
//    ViewController *vc = [[ViewController alloc] init];
//    
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
//    self.window.rootViewController = nav;
    [self example01_imageAd_networkData];
    
    return YES;
}

//{
//    "result" : true,
//    "body" : [
//              {
//                  "background" : "http:\/\/120.27.158.147\/cqjlt-member\/advert\/20170223163151914000.png",
//                  "duration" : 3,
//                  "positionIndex" : 0,
//                  "action" : {
//                      "catInfo" : {
//                          "cat2Name" : "dsdsd",
//                          "cat1No" : "1",
//                          "cat1Name" : "dsdsds",
//                          "cat2No" : "2"
//                      },
//                      "jumpValue" : "1",
//                      "actionType" : "jump",
//                      "jumpType" : "cat_2"
//                  }
//              }
//              ],
//    "mesg" : ""
//}

//图片开屏广告 - 网络数据
-(void)example01_imageAd_networkData
{
    //1.因为数据请求是异步的,请在数据请求前,调用下面方法配置数据等待时间.
    //2.设为3即表示:启动页将停留3s等待服务器返回广告数据,3s内等到广告数据,将正常显示广告,否则将自动进入window的RootVC
    //3.数据获取成功,初始化广告时,自动结束等待,显示广告
    [XHLaunchAd setWaitDataDuration:2];//请求广告数据前,必须设置
    
//    XHLaunchAd *launchAd = [XHLaunchAd i]

    //广告数据请求
//    
//    [NetworkTool sharedNetworkTool] POSTMethodWithApi:<#(NSString *)#> Parameters:<#(NSDictionary *)#> Success:<#^(id response, NSString *str)success#> Failure:<#^(NSError *error)failure#>
    
    [[NetworkTool sharedNetworkTool] POSTMethodWithApi:@"rest/client/advert/query" Parameters:@{@"clientType":@(0)} Success:^(id response, NSString *str) {
//        WFLog(@"%@",response);
//        广告数据转模型
//        LaunchAdModel *model = [[LaunchAdModel alloc] initWithDict:response[@"data"]];
//        配置广告数据
        
        NSDictionary *luchDic = response[@"body"][0];
        
//        UIImageView *imageview = [UIImageView alloc] initWithCoder:<#(nonnull NSCoder *)#>

        
//        [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
 
    } Failure:^(NSError *error) {
        
    }];
    
  
   

}
//广告点击事件
- (void)xhLaunchAd:(XHLaunchAd *)launchAd clickAndOpenURLString:(NSString *)openURLString{
    
    
}
//图片开屏广告 - 本地数据
-(void)example02_imageAd_localData
{
    //配置广告数据
    XHLaunchImageAdConfiguration *imageAdconfiguration = [XHLaunchImageAdConfiguration new];
    //广告停留时间
    imageAdconfiguration.duration = 5;
    //广告frame
    imageAdconfiguration.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    //广告图片URLString/或本地图片名(.jpg/.gif请带上后缀)
    imageAdconfiguration.imageNameOrURLString = @"image12.gif";
    //缓存机制(仅对网络图片有效)
    imageAdconfiguration.showFinishAnimate = ShowFinishAnimateLite;
    imageAdconfiguration.imageOption = XHLaunchAdImageRefreshCached;
    //图片填充模式
    imageAdconfiguration.contentMode = UIViewContentModeScaleToFill;
    //广告点击打开链接
    imageAdconfiguration.openURLString = @"https://www.baidu.com";
    //广告显示完成动画
    imageAdconfiguration.showFinishAnimate =ShowFinishAnimateFadein;
    //跳过按钮类型
    imageAdconfiguration.skipButtonType = SkipTypeTimeText;
    //后台返回时,是否显示广告
    imageAdconfiguration.showEnterForeground = NO;
    //设置要添加的子视图(可选)
    //    imageAdconfiguration.subViews = [self launchAdSubViews];
    //显示开屏广告
    [XHLaunchAd imageAdWithImageAdConfiguration:imageAdconfiguration delegate:self];
    
    
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"WFFrame"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
