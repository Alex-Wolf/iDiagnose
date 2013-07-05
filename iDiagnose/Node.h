/**
 *  Filename: Node.h
 *  Original Author: Katie Levittan
 *  Refactored-By Author: Mason Doucett
 *  Date Last Modified: 4/14/2013
 *  Purpose: Create the properties construct the objects to be used in the Node class.
 */

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Node : NSObject {
    
    //constructs the object
    Patient *data;
    Node *next;
}

/*********************Properties******************************/

@property (nonatomic, retain) Patient *data;
@property (nonatomic, retain) Node *next;

/*************************************************************/

/**
 *  Name: init
 *  Parameters: none
 *  Return: self
 *  Modified: none
 *  Purpose: constuctor for node class
 */
- (id) init;

@end

//END OF FILE