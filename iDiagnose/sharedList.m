/**
 *  Filename: sharedList.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Singleton that shares the list of patients between views.\n
 */

#import "sharedList.h"
#import "Patient.h"

static sharedList *theList;

@implementation sharedList

/**
 *  Name: init
 *  Parameters: none
 *  Return: id
 *  Modified: creates theList
 *  Purpose: creates shared list of patients for views to share
 */
-(id)init{
    
    self = [super init];
    patients = [myList new];
    
    Patient *patient1 = [[Patient alloc] initWithFirst:@"John" andLast:@"Smith" andID:1 andAge:45 andGender:@"Male" andPhoneNumber:@"(452) 567-4211"];
    
    Patient *patient2 = [[Patient alloc] initWithFirst:@"Nancy" andLast:@"White" andID:2 andAge:34 andGender:@"Female" andPhoneNumber:@"(782) 765-2846"];
    
    Patient *patient3 = [[Patient alloc] initWithFirst:@"Bruce" andLast:@"Wayne" andID:3 andAge:35 andGender:@"Male" andPhoneNumber:@"(248) 523-2394"];
    
    [patients insert:1 andData:patient1];
    [patients insert:2 andData:patient2];
    [patients insert:3 andData:patient3];
    
    return self;
}

/**
 *  Name: shareList
 *  Parameters: (id) sender
 *  Return: sharedList *theList
 *  Modified: none
 *  Purpose: gives the current list to the caller
 */
+(sharedList *)shareList{
    if (!theList) {
        theList = [[sharedList alloc] init];
    }
    return theList;
}

/**
 *  Name: setTheList
 *  Parameters: myList *newList
 *  Return: IBAction
 *  Modified: myList patients
 *  Purpose: allows other views to update the list of patients
 */
-(void)setTheList:(myList *)newList{
    patients = newList;
}

/**
 *  Name: getTheList
 *  Parameters: 
 *  Return: IBAction
 *  Modified: none
 *  Purpose: Gives the current list to the caller
 */
-(myList *)getTheList{
    return patients;
}

@end
