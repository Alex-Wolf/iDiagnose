/**
 *  Filename: ReferenceViewController.m\n
 *  Original Author: Maria Segura\n
 *  Date Last Modified: 4/21/2013\n
 *  Purpose: Allows the user to reference the DSM-IV through a web view.\n
 */

#import "ReferenceViewController.h"

@interface ReferenceViewController ()

@end

@implementation ReferenceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


/**
 *  Name: viewDidLoad\n
 *  Parameters: none\n
 *  Return: none\n
 *  Modified: initializes neccessary objects/variables/etc.\n
 *  Purpose: initializes neccessary objects/variables/etc.\n
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString *newURL = @"http://dsm.psychiatryonline.org/book.aspx?bookid=22";
    NSURL *url = [NSURL URLWithString:newURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    [self.URLField resignFirstResponder];
    //http://dsm.psychiatryonline.org/book.aspx?bookid=22
}


/**
 *  Name: didReceiveMemoryWarning\n
 *  Parameters: none\n
 *  Return: none\n
 *  Modified: none\n
 *  Purpose: calls a super function to deal with memory warnings\n
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Name: textFieldDoneEditing\n
 *  Parameters: sender -- id object that sent the request\n
 *  Return: IBAction\n
 *  Modified: webView\n
 *  Purpose: controls how editing is exited after a text field is
 *              given input by resigning it as the first responder. 
 *          Loads the URL entered by the user.\n
 */
-(IBAction)textFieldDoneEditing:(id)sender
{
    NSString *newURL = self.URLField.text;
    NSURL *url = [NSURL URLWithString:newURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    [self.URLField resignFirstResponder];
}


@end
