/**
 *  Filename: DiagnosisViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Diagnosis view.\n
 */

#import <UIKit/UIKit.h>
#import "sharedList.h"

@interface DiagnosisViewController : UIViewController

/*********************Properties******************************/

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic) NSString *diagnosisIdentifier;

@property (nonatomic) int i;
@property (nonatomic) int index;

@property (nonatomic) NSUInteger subStringRange;
@property (nonatomic) NSNumber *numberIndex;
@property (copy, nonatomic) NSArray *questions;

@property (copy, nonatomic) NSMutableArray *questionLabels;
@property (copy, nonatomic) NSMutableArray *questionButtons;
@property (copy, nonatomic) NSMutableArray *indexArray;


@property (weak, nonatomic) myList *patients;
@property (nonatomic) int patientNum;
@property (nonatomic, retain) Patient *theNewPatient;
@property (nonatomic, retain) Diagnosis *theNewDiagnosis;

/*************************************************************/

@end
