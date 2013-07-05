/**
 *  Filename: diagnoseList.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Control the list of diagnoses for each patient.\n
 */

#import "diagnoseList.h"

@implementation diagnoseList

@synthesize size, head;

/**
 *  Name: init
 *  Parameters: none
 *  Return: self
 *  Modified: all properties
 *  Purpose: constuctor for myList class
 */
- (id) init {
    if(self = [super init]) {
        size = 0;
        head = NULL;
        return(self);
    }
    return nil;
}

/**
 *  Name: isEmpty
 *  Parameters: none
 *  Return: bool: if list empty--true, otherwise--false
 *  Modified: none
 *  Purpose: check to determine whether or not the list is empty
 */
- (bool) isEmpty {
    return size == 0;
}

/**
 *  Name: insert
 *  Parameters: index--position in list to add item
 *              newItem--person being added to the list
 *  Return: bool: if insert successfull--true, otherwise--false
 *  Modifed: Person added to list. size increase by 1
 *  Purpose: add a student to the list
 */
- (bool) insert: (int) index andData: (Diagnosis *) newItem {
    
    //setting up vars for the rest
    //bool addToEnd = false;
    diagnoseNode *curr;
    curr = [[diagnoseNode alloc] init];
    diagnoseNode *prev;
    prev = [[diagnoseNode alloc] init];
    
    if (!(index > 0)) { //if index is negative or above a set maximum, cancel
        return false;
    }
    if (size == 20) {
        return false;
    }
    if (index > size + 1) { //no matter what, add item to the next available spot
        index = size + 1;
        //addToEnd = true;
    }
    
    diagnoseNode *newNode; //sets up node to insert
    newNode = [[diagnoseNode alloc] init];
    newNode.data = newItem;
    
    if (head == NULL) { //if there is no head node, sets new node to be head and returns success
        head = newNode;
        size++;
        newNode.next = NULL;
        return true;
    }
    curr = head;
    prev = head;
    
    for (int i = 1; i < index; i++) { //finds the index at which to insert
        prev = curr;
        curr = curr.next;
    }
    
    if (curr == NULL) { //puts item where it needs to be
        newNode.next = NULL;
    } else {
        newNode.next = curr;
    }
    if (curr == head) {
        //printf("cur is head");
        head = newNode;
    } else {
        prev.next = newNode;
    }
    size++;
    return true;
}

/**
 *  Name: remove
 *  Parameters: index--position in list item to be removed is located at
 *  Return: bool: if remove succeed--true, otherwise--false
 *  Modifed: node removed from list, size decrease by 1
 *  Purpose: remove a specified node from the list
 */
- (bool) remove: (int) index; {
    int i; //sets up vars for later
    diagnoseNode *curr, *prev;
    curr = [[diagnoseNode alloc] init];
    prev = [[diagnoseNode alloc] init];
    
    if (head == NULL) { //if it's an invalid index, return failure
        return false;
    }
    if ((index < 0) || (index > size)) {
        return false;
    }
    if (index == 1) { //if index is 1, advance head by one spot
        curr = head;
        head = curr.next;
        
        curr.next = NULL;
        curr = NULL;
        
        size--;
        
        return true;
    } else if (index > 1 && index < size) { //if index is in the middle, find it and
        curr =  head;
        prev = head;
        
        for (i = 1; i < index; i++) { //navigate to the correct index
            prev = curr;
            curr = curr.next;
        }
        prev.next = curr.next; //remove
        
        curr.next = NULL;
        curr = NULL;
        
        size--;
        
        return true;
        
    } else { //if index is the last item...
        curr = head;
        prev = head;
        
        for (int i = 1; i < index; i++) { //navigate to it
            prev = curr;
            curr = curr.next;
        }
        prev.next = NULL; //remove it
        
        curr.next = NULL;
        curr = NULL;
        
        size--;
        
        return true;
    }
}

/**
 *  Name: retrieve
 *  Parameters: index--position in list of person being retrieved
 *  Return: id--return person object that is either student or professor
 *  Modified: none
 *  Purpose: retrieve the data about a person in the list but does not modify
 *  the data
 */
- (id) retrieve: (int) index {
    diagnoseNode *curr; //set up vars
    curr = [[diagnoseNode alloc] init];
    int i = 1 ;
    
    if (head == NULL) { //can't retrieve if the list is empty
        return false;
    }
    if (index <= 0 || index > size) { //or if index is bad
        return false;
    } else { //navigates to the index and returns the data
        curr = head;
        while (i < size && i < index) {
            curr = curr.next;
            i++;
        }
        //chk = true;
        return curr.data;
    }
}

@end

//END OF FILE
