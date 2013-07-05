/**
 *  Filename: sharedList.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Singleton that shares the list of patients between views.\n
 */

#import <Foundation/Foundation.h>
#import "myList.h"

@interface sharedList : NSObject{
    myList *patients;
}

+(sharedList *)shareList;
-(void)setTheList:(myList *)newList;
-(myList *)getTheList;

@end
