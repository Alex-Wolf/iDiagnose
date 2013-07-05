/**
 *  Filename: DiagnosisViewController.m\n
 *  Original Author: Alex Wolf\n
 *  Date Last Modified: 5/8/2013\n
 *  Purpose: Controls the Diagnosis view.\n
 */

#import "DiagnosisViewController.h"

@interface DiagnosisViewController ()

@end

@implementation DiagnosisViewController

@synthesize questions, patients, theNewPatient, theNewDiagnosis, questionLabels, questionButtons, indexArray, numberIndex;

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
    
    self.i = 0;
    self.index = 0;
    self.subStringRange = 12;
    
    questionLabels = [[NSMutableArray alloc] init];
    questionButtons = [[NSMutableArray alloc] init];
    indexArray = [[NSMutableArray alloc] initWithCapacity:15];
    
    numberIndex = [NSNumber numberWithInt:self.index];
    //NSLog(@"%@", numberIndex);
    [indexArray addObject:numberIndex];
    
    //int blah = [[indexArray objectAtIndex:0] intValue];
    //NSLog(@"First slot = %d", blah);
    
    self.titleLabel.text = self.diagnosisIdentifier;
    
    theNewPatient = [[Patient alloc] init];
    theNewDiagnosis = [[Diagnosis alloc] init];
    theNewDiagnosis.type = self.diagnosisIdentifier;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Diagnoses"
                                                     ofType:@"plist"];
    NSDictionary *questionInfo = [NSDictionary dictionaryWithContentsOfFile:path];
    questions = [questionInfo objectForKey:self.diagnosisIdentifier];
    
    
    //Creates new label with question
    UILabel *questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150 + (self.i * 75), 400, 70)];
    [questionLabel setLineBreakMode:NSLineBreakByWordWrapping];
    questionLabel.numberOfLines = 3;
    
    NSString *newQuestion = questions[self.i];
    
    questionLabel.text = newQuestion;
    questionLabel.backgroundColor = [UIColor clearColor];
    questionLabel.tag = self.i;
    
    [questionLabels addObject:questionLabel];
    
    [self.view addSubview:questionLabel];
    
    //Creates new segmented control
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Yes", @"No"]];
    segmentedControl.frame = CGRectMake(570, 150 + (self.i * 75), 137, 44);
    segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment;
    segmentedControl.tag = self.i;
    
    [segmentedControl addTarget:self action:@selector(answerQuestion:) forControlEvents:UIControlEventValueChanged];
    
    [questionButtons addObject:segmentedControl];
    
    [self.view addSubview:segmentedControl];
    
    self.i++;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  Name: answerQuestion
 *  Parameters: (id) sender
 *  Return: IBAction
 *  Modified: none
 *  Purpose: Allows user to answer 'yes' or 'no' for each diagnostic criteria
 */
- (IBAction)answerQuestion:(id)sender
{
    UISegmentedControl *oldSegmentedControl = (UISegmentedControl *)sender;
    
    NSUInteger i;
    //NSLog(@"TAG OF BUTTON = %d", oldSegmentedControl.tag);
    
    
    
    //NSLog(@"1 - INDEX NOW = %d", self.index);
    
    //Gets rid of all labels and buttons after the current question
    for (i = [questionLabels count] - 1; i > (NSUInteger)(oldSegmentedControl.tag); i--){
        
        //NSLog(@"OLD TAG = %d", oldSegmentedControl.tag);
        //NSLog(@"ARRAY COUNT = %d", (int)[questionLabels count]);
        
       // NSLog(@"NSUINTEGER = %d", (int)i);
        
        //remove label
        UILabel *removeLabel = [questionLabels objectAtIndex:i];
        [questionLabels removeObjectAtIndex:i];
        [removeLabel removeFromSuperview];
        
        
        //remove button
        UISegmentedControl *removeButton = [questionButtons objectAtIndex:i];
        [questionButtons removeObjectAtIndex:i];
        [removeButton removeFromSuperview];
        
        //remove index from indexArray
        //NSNumber *removeNumber = [indexArray objectAtIndex:i];
        //NSLog(@"INDEX TO REMOVE = %d", [removeNumber intValue]);
        [indexArray removeObjectAtIndex:i];
        
        self.i = oldSegmentedControl.tag + 1;
        
        
    }
    
    /*NSLog(@"INDICES: ");
    for (int i = 0; i < [indexArray count]; i++){
        NSLog(@"%d - %d", i, [[indexArray objectAtIndex:i] intValue]);
    }*/
    
    self.index = [[indexArray objectAtIndex:oldSegmentedControl.tag] intValue];
    
    if (self.index * 2 + 2 < [questions count]){
        
        
        if (oldSegmentedControl.selectedSegmentIndex == 0){
            self.index = self.index * 2 + 2;
        }
        else {
            self.index = self.index * 2 + 1;
        }
        
        //NSLog(@"2 - INDEX NOW = %d", self.index);
        
        numberIndex = [NSNumber numberWithInt:self.index];
        
        [indexArray addObject:numberIndex];
        
        NSString *newQuestion = questions[self.index];
        
        if (![newQuestion isEqual:@""]){
        
            NSString *subString = [newQuestion substringToIndex:self.subStringRange];
            
            if ([subString isEqualToString:@"DIAGNOSIS - "]){
                NSString *subString2 = [newQuestion substringFromIndex:self.subStringRange];
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"Diagnosis Found"
                                      message:subString2
                                      delegate:nil
                                      cancelButtonTitle:@"Okay"
                                      otherButtonTitles:nil];
                [alert show];
                
                theNewDiagnosis.description = subString2;
                
                theNewPatient = [self.patients retrieve:self.patientNum];
                
                Diagnosis *oldDiagnosis;
                
                int theIndex;
                BOOL foundOldDiagnosis = NO;
                
                for (int i = 1; i < theNewPatient.diagnoses.size + 1; i++){
                    oldDiagnosis = [theNewPatient.diagnoses retrieve:i];
                    if (oldDiagnosis.type == self.diagnosisIdentifier){
                        theIndex = i;
                        foundOldDiagnosis = YES;
                    }
                }
                
                if (foundOldDiagnosis){
                    [theNewPatient.diagnoses remove:theIndex];
                    [theNewPatient.diagnoses insert:theIndex andData:theNewDiagnosis];
                }
                else {
                    [theNewPatient.diagnoses insert:(theNewPatient.diagnoses.size + 1) andData:theNewDiagnosis];
                }
                
                self.i++;
            }
            else {
                
                //Creates new label with question
                UILabel *questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 150 + (self.i * 75), 400, 70)];
                [questionLabel setLineBreakMode:NSLineBreakByWordWrapping];
                questionLabel.numberOfLines = 3;
                
                questionLabel.text = newQuestion;
                questionLabel.backgroundColor = [UIColor clearColor];
                questionLabel.tag = self.i;
                
                [questionLabels addObject:questionLabel];
                
                [self.view addSubview:questionLabel];
                
                //Creates new segmented control
                UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Yes", @"No"]];
                segmentedControl.frame = CGRectMake(570, 150 + (self.i * 75), 137, 44);
                segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
                segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment;
                segmentedControl.tag = self.i;
                
                [segmentedControl addTarget:self action:@selector(answerQuestion:) forControlEvents:UIControlEventValueChanged];
                
                [questionButtons addObject:segmentedControl];
                
                [self.view addSubview:segmentedControl];
                
                self.i++;
            }
        }
    }
}

@end
