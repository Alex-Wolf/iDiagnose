/**
 *  Filename: Diagnosis.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Describes a patient diagnosis.\n
 */

#import <Foundation/Foundation.h>

@interface Diagnosis : NSObject {
    
    NSString *type;
    NSString *description;
}
/********************Properties****************************/

@property (nonatomic, retain) NSString *type;
@property (nonatomic, retain) NSString *description;
/*************************************************************/

@end
