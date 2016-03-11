//
//  ViewController.h
//  habitApp
//
//  Created by Cameron Johns on 2016-02-27.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>{
    IBOutlet UITextField *goalName;
    
}

//Outlet for the GoalType UIPicker
@property (weak, nonatomic) IBOutlet UIPickerView *goalTypePicker;

@property (weak, nonatomic) IBOutlet UILabel *limitChosen;

-(IBAction)buttonPressed:(UIButton *)sender;

@end

