//
//  Goal.h
//  habitApp
//
//  Created by Cameron Johns on 2016-02-27.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject <NSCoding>

 typedef enum {
    //Distances
    Kilometres,
    Metres,
    
    //Time
    Days,
    Hours,
    Minutes,
    
    //Weight
    Pounds,
    
    //Frequency
    Units,
    //occurences,

}goalType;

//Name of Image Icon they are working towards
@property NSString* imageName;
//Name of the Goal the user is creating
@property (nonatomic) NSString* goalName;
//Limit of the Goal to reach
@property NSInteger goalLimit;

@property NSInteger goalStart;
@property NSDate* startDate;
@property NSDate* endDate;

-(NSString*) getPropertyListPath;
-(void)setGoalName:(NSString*) name;
-(void)getGoalName:(NSString*) image;
-(NSString*)getGoalName;
-(NSString*)getImageName;


@end
