/**
 *  Filename: ReferenceViewController.h\n
 *  Original Author: Maria Segura\n
 *  Date Last Modified: 4/21/2013\n
 *  Purpose: Allows the user to reference the DSM-IV through a web view.\n
 */

#import <UIKit/UIKit.h>

@interface ReferenceViewController : UIViewController

/******************Properties*********************************/
@property (weak, nonatomic) IBOutlet UITextField *URLField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
/*************************************************************/


/**
 *  Name: textFieldDoneEditing\n
 *  Parameters: sender -- id object that sent the request\n
 *  Return: IBAction\n
 *  Modified: webView\n
 *  Purpose: controls how editing is exited after a text field is
 *              given input by resigning it as the first responder.
 *          Loads the URL entered by the user.\n
 */
-(IBAction)textFieldDoneEditing:(id)sender;

@end
