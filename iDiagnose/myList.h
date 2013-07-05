/**
 *  Filename: myList.h
 *  Original Author: Sam Horwath, Josh Yanowitz
 *  Refactored-By Author: Mason Doucett
 *  Date Last Modified: 4/14/2013
 *  Purpose: Creates a list of node instances that can
 *           be modified by the user.
 */

#import <Foundation/Foundation.h>
#include "Node.h"
#include "Patient.h"

@interface myList : NSObject {
    
    //constructs the object
    int size;
    Node *head;
}

/*********************Properties******************************/

@property (nonatomic, assign) int size;
@property (nonatomic, retain) Node *head;

/*************************************************************/

/**
 *  Name: init
 *  Parameters: none
 *  Return: self
 *  Modified: all properties
 *  Purpose: constuctor for myList class
 */
- (id) init;

/**
 *  Name: isEmpty
 *  Parameters: none
 *  Return: bool: if list empty--true, otherwise--false
 *  Modified: none
 *  Purpose: check to determine whether or not the list is empty
 */
- (bool) isEmpty;

/**
 *  Name: remove
 *  Parameters: index--position in list item to be removed is located at
 *  Return: bool: if remove succeed--true, otherwise--false
 *  Modifed: node removed from list, size decrease by 1
 *  Purpose: remove a specified node from the list
 */
- (bool) remove: (int) index;

/**
 *  Name: insert
 *  Parameters: index--position in list to add item
 *              newItem--person being added to the list
 *  Return: bool: if insert successfull--true, otherwise--false
 *  Modifed: Person added to list. size increase by 1
 *  Purpose: add a student to the list
 */
- (bool) insert: (int) index andData: (Patient*) newItem;

/**
 *  Name: retrieve
 *  Parameters: idex--position in list of person being retrieved
 *  Return: id--return person object that is either student or professor
 *  Modified: none
 *  Purpose: retrieve the data about a person in the list but does not modify
 *  the data
 */
- (id) retrieve: (int) index;

@end

//END OF FILE