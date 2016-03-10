//
//  ViewController.m
//  habitApp
//
//  Created by Cameron Johns on 2016-02-27.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import "ViewController.h"
#import "Goal.h"

@interface ViewController ()

@property NSMutableArray* goalList;
@property NSString *path;

@property NSArray *pickerData;
@property NSString* selectedGoalType;
@property UIImage *logo;
@property UIImageView *logoView;
@property (weak, nonatomic) IBOutlet UISwitch *endDateSwitch;
@property (strong, nonatomic) IBOutlet UIDatePicker *endDatePicker;
@property (weak, nonatomic) IBOutlet UIButton *selectDateButton;

//Outlet for Goal Limit Stepper
@property IBOutlet UIStepper *goalLimitControl;
@property(weak, nonatomic) IBOutlet UILabel *goalLimitLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.goalList = [ NSMutableArray new ];
    
    //Goal Type UIPicker Data
    self.pickerData = @[ @"Kilometres", @"Metres", @"Days", @"Hours", @"Minutes", @"Pounds", @"Units(Frequency)" ];
    self.goalTypePicker.dataSource = self;
    self.goalTypePicker.delegate = self;
    [self.goalTypePicker selectRow:0 inComponent:0 animated:YES];
    _selectedGoalType = @"Kilometres";
    
    self.goalLimitControl.autorepeat = YES;
    self.goalLimitLabel.text = [NSString stringWithFormat:@"%d", 00];
    
    [self.endDateSwitch addTarget:self action:@selector(isEndDateSelected:) forControlEvents:UIControlEventValueChanged];
    [self.endDateSwitch setOn:NO];
   
    [self.selectDateButton setHidden:TRUE];
    
    
    Goal* newGoal = [ Goal new ];
    newGoal.goalName = @"Run 10km";
    newGoal.goalType2 = _selectedGoalType;
    newGoal.goalLimit = 20;
    newGoal.goalStart = 0;
    newGoal.imageName = @"zebra_icon";
    
    [ self.goalList addObject:newGoal ];
    
    self.logo = [UIImage imageNamed: @"logo1"];
    self.logoView = [[UIImageView alloc] initWithImage:_logo];
    
    self.navigationItem.titleView = _logoView;
    
    //Set URL path for KeyedArchiver
    self.path = newGoal.getPropertyListPath;
    
    //Load Goals from Archive
    if ( [[NSFileManager defaultManager] fileExistsAtPath:_path] ){
        self.goalList = [ NSKeyedUnarchiver unarchiveObjectWithFile:_path ];
        
        for (Goal *e in self.goalList){
            // NSLog(@"The unarchived, reconstitute object is %@", e);
        }
    }

    
}

//Goals Table View================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return( 1 );
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.goalList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" ];
    
    
    if ( cell == nil )
    {
        cell = [ [ UITableViewCell alloc ] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"Cell" ];
    }
    
    //Can access the array with the below.  But need to first put things in the array.
    Goal* myObject = self.goalList[indexPath.row];
    
    NSMutableString *goalAndType = [[NSMutableString alloc]init];
    [ goalAndType appendString:myObject.goalName ];
    [ goalAndType appendString:@" "];
    [ goalAndType appendString:_selectedGoalType];
    cell.textLabel.text = goalAndType;
    
    cell.detailTextLabel.text = [ NSString stringWithFormat: @"%ld/%ld", (long)myObject.goalStart, (long)myObject.goalLimit ];
    cell.imageView.image = [UIImage imageNamed:myObject.imageName];
    
    //Increase button in cell
    
    UIButton *increaseGoalProgress = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    increaseGoalProgress.frame = CGRectMake(250.0f, 5.0f, 150.0f, 30.0f);
    [increaseGoalProgress setTitle:@"Increase +" forState:UIControlStateNormal];
    [cell addSubview:increaseGoalProgress];
    [increaseGoalProgress addTarget:self action:@selector(increaseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
     /*
    
    // add friend button
    UIButton *addFriendButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addFriendButton.frame = CGRectMake(200.0f, 5.0f, 75.0f, 30.0f);
    [addFriendButton setTitle:@"Add" forState:UIControlStateNormal];
    [cell addSubview:addFriendButton];
    [addFriendButton addTarget:self
                        action:@selector(increaseButtonPressed:)
              forControlEvents:UIControlEventTouchUpInside];
     */
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"editGoal" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"editGoal"]) {
        
    }
}


-(void)buttonPressed:(UIButton *)sender cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *selectedCell = (UITableViewCell*) [sender superview];
    //NSIndexPath *pathToCell = [UITableView indexPathForCell:selectedCell];
    Goal* myObject = self.goalList[indexPath.row];
    myObject.goalStart += 1;
    selectedCell.detailTextLabel.text = [ NSString stringWithFormat: @"%ld/%ld", (long)myObject.goalStart, (long)myObject.goalLimit ];
}



//GoalType Picker View===============================================

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *goalTypeSelected = [ _pickerData objectAtIndex:row];
    _selectedGoalType = goalTypeSelected;
    NSLog(goalTypeSelected);
}


//# of rows of data
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

//# of columns of data
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//data to return
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}



//Goal Limit=========================================================
-(IBAction)goalLimitChanged:(UIStepper *)sender
{
    NSInteger value = sender.value;
    self.goalLimitLabel.text = [NSString stringWithFormat:@"%02ld", value];
}

//End Date Switch===================================================
-(IBAction)isEndDateSelected:(UISwitch *)sender
{
    if([_endDateSwitch isOn]) {
        _selectDateButton.hidden = NO;
        _endDatePicker = [[UIDatePicker alloc] init];
        _endDatePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _endDatePicker.datePickerMode = UIDatePickerModeDate;
        
        float y = [UIScreen mainScreen].bounds.size.height - _endDatePicker.frame.size.height - 40;
        [_endDatePicker setFrame:CGRectMake(0, y, _endDatePicker.frame.size.width, _endDatePicker.frame.size.height)];
   //     [_endDatePicker addTarget:self action:@selector(selector) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:_endDatePicker];
        
    } else {
        _selectDateButton.hidden = YES;
        [_endDatePicker removeFromSuperview];
        
    }
}

// Save data to file button ============================

-(IBAction)increaseButtonPressed:(id)sender cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"increae Hit!!");
    /*
    
    UITableViewCell *selectedCell = (UITableViewCell*) [sender superview];
    //NSIndexPath *pathToCell = [UITableView indexPathForCell:selectedCell];
    Goal* myObject = self.goalList[indexPath.row];
    myObject.goalStart += 1;
    selectedCell.detailTextLabel.text = [ NSString stringWithFormat: @"%ld/%ld", (long)myObject.goalStart, (long)myObject.goalLimit ]; */
    
    /*UITableViewCell* cell = [UITableView cellForRowAtIndexPath:indexPath];
    Goal* myObject = self.goalList[indexPath.row];
    myObject.goalStart += 1;
    cell.detailTextLabel.text = [ NSString stringWithFormat: @"%ld/%ld", (long)myObject.goalStart, (long)myObject.goalLimit ];*/
}


-(IBAction)addNewButton:(id)sender {
    
    
    //does this need to be released????
    Goal* currentGoal = [ Goal new ];
    [ currentGoal setGoalName:goalName.text ];
    [ currentGoal setImageName:@"zebra_icon" ];
    [ currentGoal setGoalType2:_selectedGoalType ];
    
    
    
    //add other fields here
    
    [ self.goalList addObject:currentGoal ];
    
    //NSLog(self.path);
    
    NSLog(@"%lu", (unsigned long)self.goalList.count);
    NSLog(currentGoal.goalName);
    
    //archive data and save to path
    [NSKeyedArchiver archiveRootObject:self.goalList toFile:self.path];
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"here in motion");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
