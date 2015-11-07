//
//  AppDelegate.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/4.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstVC.h"
#import "BrandnameVC.h"
#import "MaintltleVC.h"
#import "ShoppingLibrary.h"
#import "MainVC.h"
#import "SMS_SDK/SMS_SDK.framework/Headers/SMSSDK.h"
#import "AllHeader.pch"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [self createTabBar];
    [SMSSDK registerApp:@"be5364953f78" withSecret:@"724ad32f51756f81122440edd45e1819"];
    return YES;
}
-(void)createTabBar
{
    NSArray *titleImageArr = @[@"yuike_maintab_home_nor.png",@"yuike_maintab_iconbrand_nor.png",@"yuike_maintab_brand_nor.png",@"button_titleBar_shopcart_iOS6",@"yuike_maintab_space_nor.png"];
    NSArray *selTitleImageArr = @[@"yuike_maintab_home_sel.png",@"yuike_maintab_iconbrand_sel.png",@"yuike_maintab_brand_sel.png",@"button_titleBar_shopcart",@"yuike_maintab_space_sel.png"];
    tabBar = [[UIView alloc]initWithFrame:CGRectMake(0, mainScreen_height - (mainScreen_width / 5), mainScreen_width, (mainScreen_width / 5))];
    
    tabBar.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    [self.window addSubview:tabBar];
    for (int i = 0; i < 5; i ++)
    {
        UIButton *barBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        barBtn.frame = CGRectMake((mainScreen_width / 5) * i, 0,mainScreen_width / 5, mainScreen_width / 5);
        [barBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",titleImageArr[i]]] forState:UIControlStateNormal];
        
        [barBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",selTitleImageArr[i]]] forState:UIControlStateSelected];
        [barBtn addTarget:self action:@selector(selBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        barBtn.tag = i + 1;
        if (i == 0)
        {
            barBtn.selected = YES;
            _selectBtn = barBtn;
        }
        [tabBar addSubview:barBtn];
    }
    
    FirstVC *vc = [[FirstVC alloc]init];
    
    BrandnameVC *vc1 = [[BrandnameVC alloc]init];
    
    MaintltleVC *vc2 = [[MaintltleVC alloc]init];
    
    ShoppingLibrary *vc3 = [[ShoppingLibrary alloc]init];
    
    MainVC *vc4 = [[MainVC alloc]init];
    
    vc4.barView = tabBar;
    NSArray *vcArr = [[NSMutableArray alloc]initWithObjects:vc,vc1,vc2,vc3,vc4, nil];
    _navArr = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 5; i ++)
    {
        UIViewController *vi = vcArr[i];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vi];
        [_navArr addObject:nav];
    }
    self.window.rootViewController = _navArr[0];
    [self.window bringSubviewToFront:tabBar];
}
-(void)selBtnClick:(UIButton*)btn
{
    _selectBtn.selected = NO;
    _selectBtn=btn;
    btn.selected = YES;
    
    if (btn.tag == 5)
    {
        UINavigationController *nav = _navArr[btn.tag - 1];
        
        nav.navigationBarHidden = YES;
    }
    self.window.rootViewController = _navArr[btn.tag - 1];
    [self.window bringSubviewToFront:tabBar];
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
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

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.zhiyou.Beautywardrobe" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Beautywardrobe" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Beautywardrobe.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
