/**
 *  Filename: AddPatientViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Add Patient view.\n
 */

#import "AddPatientViewController.h"
#import "Patient.h"
#import "sharedList.h"

@interface AddPatientViewController ()

@end

@implementation AddPatientViewController

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
        self.title = NSLocalizedString(@"Add", @"Add");
    }
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
    
    self.thePatient = [[Patient alloc] init];
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
 *  Name: addPatient
 *  Parameters: (id) sender
 *  Return: IBAction
 *  Modified: none
 *  Purpose: creates an alert telling the user a patient
 *           has been added
 */
- (IBAction)addPatient:(id)sender
{
    NSString *firstName;
    NSString *lastName;
    int ID;
    int age;
    NSString *gender;
    NSString *phoneNumber;
    
    NSString *msg;
    NSString *title;
    
    
    if (([self.idNumField.text isEqual: @""]) || ([self.idNumField.text intValue] <= 0)){
        
        title = @"Invalid ID";
        msg = @"Enter a nonnegative number.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Oops!"
                              otherButtonTitles:nil];
        [alert show];
        
        self.idNumField.text = @"";
        
        return;
    }
    else {
        int index = -1;
        // Ask user for ID number
        ID = [self.idNumField.text intValue];
        
        // Error checking for ID number
        for (int i = 1; i < (patients.size + 1); i++) {
            self.oldPatient = [patients retrieve: i];
            if (ID == self.oldPatient.IDNum) {
                index = i;
                break;
            }
        }
        if (index != -1){
            title = @"Invalid ID";
            msg = @"ID already taken.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"Darn!"
                                  otherButtonTitles:nil];
            [alert show];
            
            self.idNumField.text = @"";
            
            return;
        }
    }

    
    if ([self.firstNameField.text isEqual: @""]){
        title = @"Invalid First Name";
        msg = @"Type something!";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Fine"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    else {
        firstName = self.firstNameField.text;
        
        // Reduce first name to lower case
        //firstName = [firstName lowercaseString];
    }
    
    if ([self.lastNameField.text isEqual: @""]){
        title = @"Invalid Last Name";
        msg = @"Type something!";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Fine"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    else {
        lastName = self.lastNameField.text;
        
        // Reduce last name to lower case
        //lastName = [lastName lowercaseString];
        
    }
    
    //error checking for age
    if (([self.ageField.text isEqual: @""]) || ([self.ageField.text intValue] <= 0)){
        title = @"Invalid Age";
        msg = @"Type something!";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Fine"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    else {
        age = [self.ageField.text intValue];
    }

    
    if (self.genderControl.selectedSegmentIndex == 0){
        gender = @"Male";
    }
    else if (self.genderControl.selectedSegmentIndex == 1) {
        gender = @"Female";
    }
    else {
        title = @"Invalid Gender";
        msg = @"Please select a gender.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Oops!"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    
    
    //ask user for major
    //if input is empty send out alert
    if ([self.phoneField.text isEqual: @""]){
        title = @"Invalid Phone Number";
        msg = @"Enter a phone number.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Oops!"
                              otherButtonTitles:nil];
        [alert show];
        
        self.phoneField.text = @"";
        
        return;
    }
    else {
        phoneNumber = self.phoneField.text;
    }
    
    // Sets the first name, last name, ID, GPA, Major, Graduation Year, and Status of the student based on user input
    self.thePatient.firstName = firstName;
    self.thePatient.lastName = lastName;
    self.thePatient.IDNum = ID;
    self.thePatient.age = age;
    self.thePatient.gender = gender;
    self.thePatient.phoneNumber = phoneNumber;
    
    
    // Inserts the new student into the list
    bool success = [patients insert: (patients.size + 1) andData: self.thePatient];
    
    
    //NSLog(@"%@", [NSString stringWithFormat:@"FIRST NAME = %@\nLAST NAME = %@", self.thePatient.firstName, self.thePatient.lastName]);
    
    // Display results of request
    
    
    if (success) {
        title = @"Success!";
        msg = @"Patient Added!";
        self.firstNameField.text = @"";
        self.lastNameField.text = @"";
        self.idNumField.text = @"";
        self.ageField.text = @"";
        self.genderControl.selectedSegmentIndex = UISegmentedControlNoSegment;;
        self.phoneField.text = @"";
        
    } else {
        title = @"Failure!";
        msg = @"Patient not added...";
    }
    self.thePatient = [[Patient alloc] init]; // Have to clear so that head is no longer pointing at theStudent
    
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:msg
                          delegate:nil
                          cancelButtonTitle:@"Okay"
                          otherButtonTitles:nil];
    [alert show];
    
}

/**
 *  Name: backgroundTap
 *  Parameters: (id) sender
 *  Return: none
 *  Modified: none
 *  Purpose: removes keyboard from screen
 */
- (IBAction)backgroundTap:(id)sender
{
    [self.idNumField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.firstNameField resignFirstResponder];
    [self.ageField resignFirstResponder];
    [self.phoneField resignFirstResponder];
}
@end
