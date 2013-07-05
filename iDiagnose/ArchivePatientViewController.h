/**
 *  Filename: ArchivePatientViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Archive Patient view.\n
 */

#import <UIKit/UIKit.h>
#import "myList.h"


@interface ArchivePatientViewController : UIViewController

/*********************Properties******************************/
@property (weak, nonatomic) IBOutlet UITextField *idNumField;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;
@property (weak, nonatomic) IBOutlet UILabel *removeLabel;
@property (weak, nonatomic) IBOutlet UILabel *removeIDLabel;

@property (nonatomic, retain) Patient *oldPatient;
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
 *  Name: removePatient
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: the list is modified by removing a patient
 *  Purpose: removes a specific patient from the list based
 *              on their ID # taken from the user
 */
- (IBAction)removePatient:(id)sender;

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

