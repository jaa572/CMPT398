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

//IBOutlet UIButton *addNewGoal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.goalList = [ NSMutableArray new ];
    Goal* newGoal = [ Goal new ];
    newGoal.goalName = @"Run 10km";
    newGoal.goalLimit = 20;
    newGoal.goalStart = 0;
    newGoal.imageName = @"icon";
    
    [ self.goalList addObject:newGoal ];
    
    
}

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
    
    cell.textLabel.text = myObject.goalName;
    cell.imageView.image = [UIImage imageNamed:myObject.imageName];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
