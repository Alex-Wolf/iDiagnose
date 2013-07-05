/**
 *  Filename: TrackPatientViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Track Patient view.\n
 */

#import <UIKit/UIKit.h>
#import "myList.h"
#import "DecisionTreeViewController.h"

@interface TrackPatientViewController : UIViewController

/*********************Properties******************************/
@property (weak, nonatomic) IBOutlet UILabel *trackLabel;
@property (weak, nonatomic) IBOutlet UILabel *trackIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idNumLabel;
@property (weak, nonatomic) IBOutlet UITextField *searchIDField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameField;
@property (weak, nonatomic) IBOutlet UITextField *idNumField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *divider;

@property (weak, nonatomic) IBOutlet UILabel *diagnosesLabel;

@property (weak, nonatomic) IBOutlet UIButton *trackButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *anotherButton;
@property (weak, nonatomic) IBOutlet UIButton *diagnoseButton;

@property (nonatomic, retain) Patient *thePatient;
@property (nonatomic, retain) Patient *tempPatient;

@property (weak, nonatomic) myList *patients;
/*************************************************************/

/**
 *  Name: initWithNibName
 *  Parameters: NSString* nibName, NSBundle* nibBundle, myList list
 *  Return: none
 *  Modified: initializes class.
 *  Purpose: initializes class and allows passing of the list.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withList:(id)list;

/**
 *  Name: trackButtonPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: labels/fields/etc. specific to the track interface
 *              are made visible and the rest are made invisible
 *  Purpose: presents the user with the person requested from the list
 *              and provides the abiltiy to edit
 */
- (IBAction)trackButtonPressed:(id)sender;

/**
 *  Name: saveButtonPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: the data contained within the patient object
 *              being viewed from the list are updated
 *  Purpose: saves data from the user fields, checks it,
 *              and commits the changes to the patient object
 */
- (IBAction)saveButtonPressed:(id)sender;

/**
 *  Name: anotherButtonPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: labels/fields/etc. specific to the track-search interface
 *              are made visible and the rest are made invisible
 *  Purpose: presents the user with the ability to search/track
 *              another patient in the list
 */
- (IBAction)anotherButtonPressed:(id)sender;

/**
 *  Name: textFieldDoneEditing
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: controls how editing is exited after a text field is
 *              given input by resigning it as the first responder
 */
- (IBAction)textFieldDoneEditing:(id)sender;

/**
 *  Name: backgroundTap
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: tells input-capable fields to resign as the
 *              first responder when the user clicks the background
 */
- (IBAction)backgroundTap:(id)sender;

@end
//END OF FILE

