/**
 *  Filename: PatientViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the patient view.\n
 */

#import <UIKit/UIKit.h>
#import "myList.h"

@interface PatientViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

/*********************Properties******************************/
@property (weak, nonatomic) myList *patients;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/*************************************************************/


@end
