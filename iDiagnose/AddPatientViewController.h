/**
 *  Filename: AddPatientViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Add Patient view.\n
 */

#import <UIKit/UIKit.h>
#import "myList.h"
#import "Patient.h"

@interface AddPatientViewController : UIViewController

/*********************Properties******************************/
@property (weak, nonatomic) IBOutlet UITextField *idNumField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UIButton *addPatientButton;

@property (weak, nonatomic) myList *patients;
@property (nonatomic, retain) Patient *thePatient;
@property (nonatomic, retain) Patient *oldPatient;
/*************************************************************/

/**
 *  Name: addPatient
 *  Parameters: (id) sender
 *  Return: IBAction
 *  Modified: none
 *  Purpose: creates an alert telling the user a patient
 *           has been added
 */
- (IBAction)addPatient:(id)sender;

/**
 *  Name: backgroundTap
 *  Parameters: (id) sender
 *  Return: none
 *  Modified: none
 *  Purpose: removes keyboard from screen
 */
- (IBAction)backgroundTap:(id)sender;


@end
