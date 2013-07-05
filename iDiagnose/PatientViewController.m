/**
 *  Filename: PatientViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the patient view.\n
 */

#import "PatientViewController.h"
#import "Patient.h"
#import "sharedList.h"

@interface PatientViewController ()

@end

@implementation PatientViewController

@synthesize patients;

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
    /*self.patients = @[@"Thomas Quinn", @"Alex Wolf",
                      @"Mason Doucett", @"Artem Kovalenko", @"Maria Segura", @"David Banker", @"John Barr", @"Doug Turnbull", @"Ali Erkan",@"John Smith", @"Jane Doe", @"George Clooney", @"Michael Jordan", @"Tiger Woods", @"Wayne Rooney", @"Batman", @"Robin"];*/
    /*if (self.patients == nil){
        //NSLog(@"Patient list is empty");
        sharedList * mySharedList = [sharedList shareList];
        patients = mySharedList.getTheList;
        if (patients == nil){
            myList * tempList = [[myList alloc] init];
            patients = tempList;
            [mySharedList setTheList:patients];
        }
    }*/
    
}

- (void)viewWillAppear:(BOOL)animated
{
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
    
    [self.tableView reloadData];
    
}


#pragma mark -
#pragma mark Table View Data Source Methods


/**
 *  Name: tableView: numberOfRowsInSection:
 *  Parameters: (UITableView *) tableview, (NSInteger)section
 *  Return: NSInteger
 *  Modified: none
 *  Purpose: returns the number of rows in table
 */
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    //return [self.patients count];
    return self.patients.size;
}

/**
 *  Name: tableView: cellForRowAtIndexPath:
 *  Parameters: (UITableView *) tableview, (NSIndePath *)indexPath
 *  Return: UITableViewCell *
 *  Modified: none
 *  Purpose: returns a cell for the table
 */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:SimpleTableIdentifier];
    }
    
    //UIImage *image = [UIImage imageNamed:@"star.png"];
    //cell.imageView.image = image;
    
    
    Patient *oldPatient = [self.patients retrieve:indexPath.row + 1];
    //NSLog(@"%@", oldPatient);
    //NSLog(@"%@", [NSString stringWithFormat:@"Patient's name: %@", oldPatient.firstName]);
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@", oldPatient.lastName, oldPatient.firstName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"ID: %d", oldPatient.IDNum];
    
    
    //cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    
    return cell;
}

#pragma mark -
#pragma mark Table Delegate Methods

/*
 - (NSInteger)tableView:(UITableView *)tableView
 indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
 {
 return indexPath.row;
 }
 */

/**
 *  Name: tableView: willSelectRowAtIndexPath
 *  Parameters: (UITableView *) tableview, (NSIndexPath *)indexPath
 *  Return: NSIndexPath *
 *  Modified: none
 *  Purpose: returns indexPath
 */
- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

/**
 *  Name: tableView: didSelectRowAtIndexPath
 *  Parameters: (UITableView *) tableview, (NSIndexPath *)indexPath
 *  Return: none
 *  Modified: none
 *  Purpose: creates alert telling user which table row they selected
 */
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Patient *oldPatient = [self.patients retrieve:indexPath.row + 1];
    NSString *title = [NSString stringWithFormat:@"%@ %@", oldPatient.firstName, oldPatient.lastName];
    NSString *message = [NSString stringWithFormat:@"ID: %d\nAge: %d\nGender: %@\nPhone: %@", oldPatient.IDNum, oldPatient.age, oldPatient.gender, oldPatient.phoneNumber];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:title
                          message:message
                          delegate:nil
                          cancelButtonTitle:@"Back"
                          otherButtonTitles:nil];
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/**
 *  Name: tableView: heightForRowAtIndexPath
 *  Parameters: (UITableView *) tableview, (NSIndexPath *)indexPath
 *  Return: CGFloat
 *  Modified: none
 *  Purpose: returns height for each row
 */
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
@end
