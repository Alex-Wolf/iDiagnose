/**
 *  Filename: diagnoseNode.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Node for the list of diagnoses for each patient.\n
 */

#import <Foundation/Foundation.h>
#import "Diagnosis.h"

@interface diagnoseNode : NSObject {
    
    //constructs the object
    Diagnosis *data;
    diagnoseNode *next;
}

/*********************Properties******************************/

@property (nonatomic, retain) Diagnosis *data;
@property (nonatomic, retain) diagnoseNode *next;

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
