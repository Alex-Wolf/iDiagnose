/**
 *  Filename: Patient.h
 *  Original Author: Mason Doucett
 *  Date Last Modified: 5/8/2013
 *  Purpose: An object that holds a first and last name, and an
 *              identification number.
 */

#ifndef PERSON_H
#define	PERSON_H
#include <foundation/foundation.h>
#import "diagnoseList.h"

@class Patient;

@interface Patient : NSObject {
 
    // Constructs the object
    NSString *firstName;
    NSString *lastName;
    int IDNum;
    int age;
    NSString *gender;
    NSString *phoneNumber;
    diagnoseList *diagnoses;
}

/*********************Properties******************************/

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, assign) int IDNum;
@property (nonatomic, assign) int age;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *phoneNumber;
@property (nonatomic, retain) diagnoseList *diagnoses;

/*************************************************************/

/**
 *  Name: init
 *  Parameters: none
 *  Return: self
 *  Modified: none
 *  Purpose: constuctor for patient class
 */
- (id) init;

/**
 *  Name: initWith
 *  Parameters: a, b, c
 *  Return: First Last ID
 *  Modified: none
 *  Purpose: create a patient
 */
- (id) initWithFirst: (NSString*) a andLast: (NSString*) b andID: (int) c andAge: (int) d andGender: (NSString *) e andPhoneNumber: (NSString *) f;

@end

#endif	/* PATIENT_H */

//END OF FILE