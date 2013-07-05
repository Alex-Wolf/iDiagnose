/**
 *  Filename: ArchivePatientViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Archive Patient view.\n
 */

#import "ArchivePatientViewController.h"
#import "sharedList.h"


@interface ArchivePatientViewController ()

@end

@implementation ArchivePatientViewController

@synthesize patients;

/**
 *  Name: initWithNibName
 *  Parameters: NSString* nibName, NSBundle* nibBundle
 *  Return: none
 *  Modified: initializes class.
 *  Purpose: initializes class and allows passing of the list.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Remove", @"Remove");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

/**
 *  Name: initWithNibName
 *  Parameters: NSString* nibName, NSBundle* nibBundle, myList list
 *  Return: none
 *  Modified: initializes class.
 *  Purpose: initializes class and allows passing of the list.
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withList:(id)list
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Remove", @"Remove");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    
    self.patients = (myList *)list;
    
    return self;
}

/**
 *  Name: viewDidLoad
 *  Parameters: none
 *  Return: none
 *  Modified: initializes neccessary objects/variables/etc.
 *  Purpose: initializes neccessary objects/variables/etc.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.oldPatient = [[Patient alloc] init];
    
    if (self.patients == nil){
        //NSLog(@"Patient list is empty");
        sharedList * mySharedList = [sharedList shareList];
        patients = mySharedList.getTheList;
        if (patients == nil){
            myList * tempList = [[myList alloc] init];
            patients = tempList;
            [mySharedList setTheList:patients];
        }
    }
}

/**
 *  Name: didReceiveMemoryWarning
 *  Parameters: none
 *  Return: none
 *  Modified: none
 *  Purpose: calls a super function to deal with memory warnings
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Name: removePatient
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: the list is modified by removing a patient
 *  Purpose: removes a specific patient from the list based
 *              on their ID # taken from the user
 */
- (IBAction)removePatient:(id)sender
{
    
    [self.idNumField resignFirstResponder];
    // Variables for finding the correct patient
    int ID;
    int index = -1;
    NSString *title, *msg;
    
    ID = [self.idNumField.text intValue];
    
    // Traverse the list and find the correct ID number
    for (int i = 1; i < (patients.size + 1); i++) {
        self.oldPatient = [patients retrieve: i];
        if (ID == self.oldPatient.IDNum) {
            index = i;
        }
    }
    // Error checking for finding the requested ID number
    if (index == -1) {
        
        title = @"Invalid Index";
        msg = @"Person could not be found.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        self.idNumField.text = @"";
        
    }
    else {
        // Removes selected patient from list
        bool success = [patients remove: index];
        
        // Display results of request
        if (success) {
            title = @"Succeeded!";
            msg = @"Patient has been removed!";
        } else {
            title = @"Failed!";
            msg = @"Patient has not been removed!";
        }
        
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        self.idNumField.text = @"";
    }
}

/**
 *  Name: backgroundTap
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: tells input-capable fields to resign as the
 *              first responder when the user clicks the background
 */
- (IBAction)backgroundTap:(id)sender
{
    [self.idNumField resignFirstResponder];
}

@end
//END OF FILE
