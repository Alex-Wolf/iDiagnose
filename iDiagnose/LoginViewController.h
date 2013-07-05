/**
 *  Filename: LoginViewController.h\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the login view.\n
 */

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

/***********************Properties*************************/

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *password;
/*************************************************************/


/**
 *  Name: login\n
 *  Parameters: sender name and password\n
 *  Return: none\n
 *  Modified: none\n
 *  Purpose: To authorize user to move onto the patients view\n
 */
- (IBAction)login:(id)sender;


@end
