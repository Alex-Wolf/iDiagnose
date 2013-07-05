/**
 *  Filename: AppDelegate.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: App delegation.\n
 */

#import "AppDelegate.h"
#import "Patient.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /*
    self.patients = [[myList alloc] init];
    
    //TESTING - places three patients into list to independently test the track nib
    Patient *patient1 = [[Patient alloc] init];
    patient1.firstName = @"Mason";
    patient1.lastName = @"Doucett";
    patient1.IDNum = 1;
    
    Patient *patient2 = [[Patient alloc] init];
    patient2.firstName = @"John";
    patient2.lastName = @"Barr";
    patient2.IDNum = 2;
    
    Patient *patient3 = [[Patient alloc] init];
    patient3.firstName = @"Alex";
    patient3.lastName = @"Wolf";
    patient3.IDNum = 3;
    
    [self.patients insert: (patients.size + 1) andData: patient1];
    [self.patients insert: (patients.size + 1) andData: patient2];
    [self.patients insert: (patients.size + 1) andData: patient3];*/
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
