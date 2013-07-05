/**
 *  Filename: TrackPatientViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Track Patient view.\n
 */

#import "TrackPatientViewController.h"
#import "sharedList.h"

@interface TrackPatientViewController ()

@end

@implementation TrackPatientViewController

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
        self.title = NSLocalizedString(@"Track", @"Track");
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
        self.title = NSLocalizedString(@"Track", @"Track");
    }
    
    patients = (myList *)list;
    
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
    self.thePatient = [[Patient alloc] init];
    self.tempPatient = [[Patient alloc] init];
    
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
 *  Name: viewDidAppear
 *  Parameters: animated
 *  Return: none
 *  Modified: initializes the view's setup.
 *  Purpose: Makes sure user sees correct information
 */
- (void)viewDidAppear:(BOOL)animated
{
    self.trackLabel.hidden = NO;
    self.searchIDField.hidden = NO;
    self.trackIDLabel.hidden = NO;
    self.trackButton.hidden = NO;
    
    self.firstNameLabel.hidden = YES;
    self.lastNameLabel.hidden = YES;
    self.idNumLabel.hidden = YES;
    self.firstNameField.hidden = YES;
    self.lastNameField.hidden = YES;
    self.ageLabel.hidden = YES;
    self.ageField.hidden = YES;
    self.genderLabel.hidden = YES;
    self.genderControl.hidden = YES;
    self.phoneLabel.hidden = YES;
    self.phoneField.hidden = YES;
    self.divider.hidden = YES;
    self.diagnosesLabel.hidden = YES;
    
    self.idNumField.hidden = YES;
    self.saveButton.hidden = YES;
    self.anotherButton.hidden = YES;
    self.diagnoseButton.hidden = YES;
}

/**
 *  Name: trackButtonPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: labels/fields/etc. specific to the track interface
 *              are made visible and the rest are made invisible
 *  Purpose: presents the user with the person requested from the list
 *              and provides the abiltiy to edit
 */
- (IBAction)trackButtonPressed:(id)sender
{
    // Variable to store requested ID number
    NSString *stringID;
    // Variable to store requested ID number
    int ID;
    // Variables to use for alerts
    NSString *title, *msg;
    // Index variable for searching list
    int index;
    
    // Error checking to ensure search field is not empty or has a negative value
    if (([self.searchIDField.text isEqual: @""]) || ([self.searchIDField.text intValue] <= 0)){
        
        title = @"Invalid ID";
        msg = @"Enter a nonnegative number";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        self.searchIDField.text = @"";
        
        return;
    }
    
    // Get the requested ID
    stringID = self.searchIDField.text;
    // Convert to int
    ID = [stringID intValue];
    // Set index
    index = -1;
    
    // Traverse the list and look for the patient
    for (int i = 1; i < (patients.size + 1); i++) {
        self.thePatient = [patients retrieve: i];
        if (ID == self.thePatient.IDNum) {
            index = i;
            break;
        }
    }
    
    // Error checking for finding the requested ID number
    if (index == -1) {
        
        // If not found, display error alert to the user
        title = @"Invalid Index";
        msg = @"Person could not be found.";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        self.searchIDField.text = @"";
        
    }
    // If the ID number was found
    else {
        
        // Retrieves the given person's information
        self.thePatient = [patients retrieve: index];
        
        // Set person's info if successful
        if ((bool)self.thePatient) {
            
            // Set appropriate components to be visible/invisible
            self.trackButton.hidden = YES;
            self.searchIDField.hidden = YES;
            self.trackIDLabel.hidden = YES;
            
            self.firstNameLabel.hidden = NO;
            self.firstNameField.hidden = NO;
            self.lastNameField.hidden = NO;
            self.lastNameLabel.hidden = NO;
            self.idNumLabel.hidden = NO;
            self.idNumField.hidden = NO;
            self.ageLabel.hidden = NO;
            self.ageField.hidden = NO;
            self.genderLabel.hidden = NO;
            self.genderControl.hidden = NO;
            self.phoneLabel.hidden = NO;
            self.phoneField.hidden = NO;
            self.divider.hidden = NO;
            self.diagnosesLabel.hidden = NO;
            
            self.saveButton.hidden = NO;
            self.anotherButton.hidden = NO;
            self.diagnoseButton.hidden = NO;
            
            // Display the patient data on the nib
            self.firstNameField.text = self.thePatient.firstName;
            self.lastNameField.text = self.thePatient.lastName;
            self.idNumField.text = [NSString stringWithFormat:@"%d", self.thePatient.IDNum];
            self.ageField.text = [NSString stringWithFormat:@"%d", self.thePatient.age];
            if ([self.thePatient.gender isEqual: @"Male"]){
                self.genderControl.selectedSegmentIndex = 0;
            }
            else {
                self.genderControl.selectedSegmentIndex = 1;
            }
            self.phoneField.text = self.thePatient.phoneNumber;
        }
    }
    
    for (int i = 1; i < self.thePatient.diagnoses.size + 1; i++){
        UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 450 + (i * 40), 700, 50)];
        [myLabel setLineBreakMode:NSLineBreakByWordWrapping];
        myLabel.numberOfLines = 0;
        Diagnosis *diagnosis = [self.thePatient.diagnoses retrieve:i];
        myLabel.text = [NSString stringWithFormat:@"%@ - %@", diagnosis.type, diagnosis.description];
        myLabel.backgroundColor = [UIColor clearColor];
        [self.view addSubview:myLabel];
    }
    
    
    [self.searchIDField resignFirstResponder];
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.idNumField resignFirstResponder];
    [self.ageField resignFirstResponder];
    [self.phoneField resignFirstResponder];
}

/**
 *  Name: saveButtonPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: the data contained within the patient object
 *              being viewed from the list are updated
 *  Purpose: saves data from the user fields, checks it,
 *              and commits the changes to the patient object
 */
- (IBAction)saveButtonPressed:(id)sender {
    
    // Variables to store updated patient information
    NSString *firstName;
    NSString *lastName;
    int ID;
    int age;
    NSString *gender;
    NSString *phoneNumber;
    
    // Variables used for alerts
    NSString *msg;
    NSString *title;
    
    // If the firstNameField is empty display an error message
    if ([self.firstNameField.text isEqual: @""]){
        
        title = @"Invalid First Name";
        msg = @"Input required";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    // If the firstNameField is not empty...
    else {
        
        // Save the data from the field
        firstName = self.firstNameField.text;
        
        // Reduce first name to lower case
        //firstName = [firstName lowercaseString];
    }
    
    // If the lastNameField is empty display an error message
    if ([self.lastNameField.text isEqual: @""]){
        
        title = @"Invalid Last Name";
        msg = @"Input Required";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        return;
    }
    // If the lastNameField is not empty...
    else {
        
        // Save the data from the field
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
    else {
        gender = @"Female";
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
    
    // If the idNumField is empty or negative, display an error message
    if (([self.idNumField.text isEqual: @""]) || ([self.idNumField.text intValue] <= 0)){
        
        title = @"Invalid ID";
        msg = @"Enter a nonnegative number";
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:title
                              message:msg
                              delegate:nil
                              cancelButtonTitle:@"Done"
                              otherButtonTitles:nil];
        [alert show];
        
        self.idNumField.text = @"";
        
        return;
    }
    // If the idNumField is not empty...
    else {
        
        // Check if it is the same ID as before
        if([self.idNumField.text intValue] == self.thePatient.IDNum)
        {
            // Save/set all new patient data
            self.thePatient.firstName = firstName;
            self.thePatient.lastName = lastName;
            self.thePatient.IDNum = [self.idNumField.text intValue];
            self.thePatient.age = age;
            self.thePatient.gender = gender;
            self.thePatient.phoneNumber = phoneNumber;
            
            // Display success message
            title = @"Patient Data Updated";
            msg = @"The new patient information has been saved.";
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:title
                                  message:msg
                                  delegate:nil
                                  cancelButtonTitle:@"Done"
                                  otherButtonTitles:nil];
            [alert show];
            
            return;
        }
        // If the ID is different than before
        else{
            
            //set index for search
            int index = -1;
            
            // Get ID number to search for avaliability
            ID = [self.idNumField.text intValue];
            
            // Error checking for ID number
            for (int i = 1; i < (patients.size + 1); i++) {
                self.tempPatient = [patients retrieve: i];
                if (ID == self.tempPatient.IDNum) {
                    index = i;
                    break;
                }
            }
            
            // If the ID is already taken display an error message
            if (index != -1){
                
                title = @"Invalid ID";
                msg = @"ID already taken.";
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:title
                                      message:msg
                                      delegate:nil
                                      cancelButtonTitle:@"Done"
                                      otherButtonTitles:nil];
                [alert show];
                
                self.idNumField.text = @"";
                
                return;
            }
            // If the ID is available to use...
            else{
                
                // Save/set all of the new patient data
                self.thePatient.firstName = firstName;
                self.thePatient.lastName = lastName;
                self.thePatient.IDNum = ID;
                self.thePatient.age = age;
                self.thePatient.gender = gender;
                self.thePatient.phoneNumber = phoneNumber;
                
                // Display success message
                title = @"Patient Data Updated";
                msg = @"The new patient information has been saved.";
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:title
                                      message:msg
                                      delegate:nil
                                      cancelButtonTitle:@"Done"
                                      otherButtonTitles:nil];
                [alert show];
                
                return;
            }
        }
    }
}

/**
 *  Name: anotherButtonPressed
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: labels/fields/etc. specific to the track-search interface
 *              are made visible and the rest are made invisible
 *  Purpose: presents the user with the ability to search/track
 *              another patient in the list
 */
- (IBAction)anotherButtonPressed:(id)sender {
    
    // Components to search the list for a patient to track are made visible
    self.trackButton.hidden = NO;
    self.searchIDField.hidden = NO;
    self.trackIDLabel.hidden = NO;
    
    // Resets the search field component
    self.searchIDField.text = @"";
    
    // Hides specific components for displaying patient data
    self.firstNameLabel.hidden = YES;
    self.firstNameField.hidden = YES;
    self.lastNameField.hidden = YES;
    self.lastNameLabel.hidden = YES;
    self.idNumLabel.hidden = YES;
    self.idNumField.hidden = YES;
    self.ageLabel.hidden = YES;
    self.ageField.hidden = YES;
    self.genderLabel.hidden = YES;
    self.genderControl.hidden = YES;
    self.phoneLabel.hidden = YES;
    self.phoneField.hidden = YES;
    self.saveButton.hidden = YES;
    self.anotherButton.hidden = YES;
    self.diagnoseButton.hidden = YES;
    self.divider.hidden = YES;
    self.diagnosesLabel.hidden = YES;
}

/**
 *  Name: textFieldDoneEditing
 *  Parameters: sender -- id object that sent the request
 *  Return: IBAction
 *  Modified: none
 *  Purpose: controls how editing is exited after a text field is
 *              given input by resigning it as the first responder
 */
- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
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
    [self.searchIDField resignFirstResponder];
    [self.firstNameField resignFirstResponder];
    [self.lastNameField resignFirstResponder];
    [self.idNumField resignFirstResponder];
    [self.ageField resignFirstResponder];
    [self.phoneField resignFirstResponder];
}

/**
 *  Name: prepareForSegue
 *  Parameters: sender -- id object that sent the request
                segue -- UIStoryboardSegue
 *  Return: void
 *  Modified: none
 *  Purpose: Prepares the view for a segue
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"TrackToDiagnose"]) {
        DecisionTreeViewController *vc = (DecisionTreeViewController *) segue.destinationViewController;
        
        int index;
        
        for (int i = 1; i < (patients.size + 1); i++) {
            self.thePatient = [patients retrieve: i];
            if ([self.idNumField.text intValue] == self.thePatient.IDNum) {
                index = i;
                break;
            }
        }
        vc.patientNum = index;
    }
}

@end
//END OF FILE
