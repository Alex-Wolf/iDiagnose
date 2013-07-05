/**
 *  Filename: DecisionTreeViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Decision Tree view.\n
 */

#import "DecisionTreeViewController.h"
//#import "AggressionViewController.h"
//#import "CatatoniaViewController.h"
#import "DiagnosisViewController.h"

@interface DecisionTreeViewController ()

@end

@implementation DecisionTreeViewController

@synthesize patients, patientNum;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Name: prepareForSegue
 *  Parameters: sender -- id object that sent the request
 segue -- UIStoryboardSegue
 *  Return: void
 *  Modified: none
 *  Purpose: Prepares the view for a segue to whichever diagnosis tree is selected
 */
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    DiagnosisViewController *vc = (DiagnosisViewController *) segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"DiagnoseToAggression"]) {
        vc.diagnosisIdentifier = @"Aggression";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToCatatonia"]) {
        vc.diagnosisIdentifier = @"Catatonia";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToHypersomnia"]) {
        vc.diagnosisIdentifier = @"Hypersomnia";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToInsomnia"]) {
        vc.diagnosisIdentifier = @"Insomnia";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToPain"]) {
        vc.diagnosisIdentifier = @"Pain";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToSuicide"]) {
        vc.diagnosisIdentifier = @"Suicide";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToSelfHarm"]) {
        vc.diagnosisIdentifier = @"Self Harm";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToPsychomotorRetardation"]) {
        vc.diagnosisIdentifier = @"Psychomotor-Retardation";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToMemoryImpairment"]) {
        vc.diagnosisIdentifier = @"Memory Impairment";
        vc.patientNum = self.patientNum;
    }
    else if ([segue.identifier isEqualToString:@"DiagnoseToDistractibility"]) {
        vc.diagnosisIdentifier = @"Distractibility";
        vc.patientNum = self.patientNum;
    }
}

@end
