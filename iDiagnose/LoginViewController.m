/**
 *  Filename: LoginViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the login view.\n
 */

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize name, password;

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
    name = @"Bill Hudenko";
    password = @"SCIDSucks";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Name: login\n
 *  Parameters: sender name and password\n
 *  Return: none\n
 *  Modified: none\n
 *  Purpose: To authorize user to move onto the patients view\n
 */
- (IBAction)login:(id)sender
{
    NSString *newName = self.nameField.text;
    NSString *newPassword = self.passwordField.text;
    BOOL correctLogin = YES;
    
    self.errorLabel.text = @"";
    
    if (![newName isEqual: name]){
        self.errorLabel.text = @"Invalid name\n";
        correctLogin = NO;
    }
    
    if (![newPassword isEqual: password]){
        self.errorLabel.text = [self.errorLabel.text stringByAppendingString:@"Invalid password"];
        correctLogin = NO;
    }
    
    if (correctLogin){
        //[self dismissModalViewControllerAnimated:YES];
        [self performSegueWithIdentifier:@"LoginToPatient" sender:sender];
    }
}

- (IBAction)backgroundTap:(id)sender
{
    [self.nameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}
@end
