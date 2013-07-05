/**
 *  Filename: DecisionTreeViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Decision Tree view.\n
 */

#import <UIKit/UIKit.h>
#import "sharedList.h"

@interface DecisionTreeViewController : UIViewController

/**********************Properties***************************/

@property (weak, nonatomic) IBOutlet UIButton *aggressionButton;
@property (weak, nonatomic) IBOutlet UIButton *catatoniaButton;
@property (strong, nonatomic) IBOutlet UIButton *insomniaButton;
@property (strong, nonatomic) IBOutlet UIButton *hypersomniaButton;
@property (strong, nonatomic) IBOutlet UIButton *memoryImpairmentButton;
@property (strong, nonatomic) IBOutlet UIButton *suicideButton;
@property (strong, nonatomic) IBOutlet UIButton *painButton;
@property (strong, nonatomic) IBOutlet UIButton *selfHarmButton;
@property (strong, nonatomic) IBOutlet UIButton *psychoMotorButton;


@property (weak, nonatomic) myList *patients;
@property (nonatomic) int patientNum;
/*************************************************************/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
