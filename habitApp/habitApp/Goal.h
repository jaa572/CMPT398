//
//  Goal.h
//  habitApp
//
//  Created by Cameron Johns on 2016-02-27.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject <NSCoding>

/*
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

}goalType; */


@property (nonatomic) NSString* goalName;
@property NSString* goalType;
@property (nonatomic) NSInteger goalLimit;
@property NSInteger goalCurrent;

@property NSDate* startDate;
@property NSDate* endDate;

@property (nonatomic) NSString* imageName;


-(void)setGoalName:(NSString*) name;
-(void)setGoalType2:(NSString *)goalSelected;
-(void)setGoalLimit:(NSInteger) limit;
-(void)setCurrentCompleted:(NSInteger) completed;

//setStartDate
//setEndDate

-(void)setImageName:(NSString*) image;


-(NSString*)getGoalName;
-(NSString*)getGoalType;
-(NSInteger)getGoalLimit;
-(NSInteger)getCurrentCompleted;

//getStartdate
//getEndDate

-(NSString*)getImageName;

-(NSString*) getPropertyListPath;
-(void)increaseGoalCompleted;


@end
