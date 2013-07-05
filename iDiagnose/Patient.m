/**
 *  Filename: Patient.m
 *  Original Author: Mason Doucett
 *  Date Last Modified: 5/08/2013
 *  Purpose: Creates an instance of an object that holds a first and last
 *                  name, and an identification number.
 */

#include "Patient.h"
#import "Diagnosis.h"

@implementation Patient

@synthesize firstName, lastName, IDNum, age, gender, phoneNumber, diagnoses;

/**
 *  Name: init
 *  Parameters: none
 *  Return: Patient Object
 *  Modified: none
 *  Purpose: create a patient
 */
- (id) init {
    if(self = [super init]) {
        firstName = @"John";
        lastName = @"Smith";
        IDNum = 000000;
        gender = @"Male";
        phoneNumber = @"(607) 555-5555";
        diagnoses = [[diagnoseList alloc] init];
        return(self);
    } else {
        return nil;
    }
}

/**
 *  Name: initWith
 *  Parameters: a, b, c, d
 *  Return: Patient Object
 *  Modified: none
 *  Purpose: create a patient
 */
- (id) initWithFirst: (NSString*) a andLast: (NSString*) b andID: (int) c andAge: (int) d andGender: (NSString *) e andPhoneNumber: (NSString *) f{
    if(self = [super init]) {
        firstName = a;
        lastName = b;
        IDNum = c;
        age = d;
        gender = e;
        phoneNumber = f;
        diagnoses = [[diagnoseList alloc] init];
        return(self);
    } else {
        return nil;
    }
}

@end

//END OF FILE