/**
 *  Filename: diagnoseNode.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Node for the list of diagnoses for each patient.\n
 */

#import "diagnoseNode.h"

@implementation diagnoseNode

@synthesize next, data;

/**
 *  Name: init
 *  parameters:  none
 *  returns:	none
 *  precondition: none
 *  postcondition: next value is null
 *  Algorithm: sets next value of the node to null
 */
- (id) init {
    if (self = [super init]) {
        return (self);
    }
    return nil;
}

@end

//END OF FILE
