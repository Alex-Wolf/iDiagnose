/**
 *  Filename: Node.m
 *  Original Author: Katie Levittan
 *  Refactored-By Author: Mason Doucett
 *  Date Last Modified: 4/14/2013
 *  Purpose: The purpose is to create a constructor and set the next value to null.
 */

#import "Node.h"

@implementation Node

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