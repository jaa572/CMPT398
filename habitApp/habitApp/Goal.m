//
//  Goal.m
//  habitApp
//
//  Created by Cameron Johns on 2016-02-27.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import "Goal.h"

@implementation Goal

//Goal Constructor

- (id) init {
    self = [super init];
    if (self != nil) {
        // initializations go here.
    }
    return self;
}

-(void)setGoalName:(NSString*) name
{
    _goalName = name;
}

-(void)setImageName:(NSString*) image
{
    _imageName = image;
}

-(void)setGoalLimit:(NSInteger) limit
{
    _goalLimit = limit;
}

-(void)setGoalType2:(NSString *)goalSelected
{
    _goalType = goalSelected;
}

-(void)setCurrentCompleted:(NSInteger) completed
{
    
}

-(NSString*)getGoalName{
    
    return _goalName;
}

-(NSString*)getImageName
{
    return _imageName;
}

-(NSInteger)getGoalLimit

{
    return _goalLimit;
}

-(NSString*)getGoalType
{
    return _goalType;
}

-(NSInteger)getCurrentCompleted
{
    return _goalCurrent;
}

-(void)increaseGoalCompleted{
    //_goalCurrent. += 1;
    
}


-(NSString*) getPropertyListPath{
    NSURL *documentDir = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *plist = [documentDir URLByAppendingPathComponent:@"goalList3.plist"];
    return plist.path;
}


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_goalName forKey:@"userGoalName"];
    [coder encodeObject:_imageName forKey:@"imageName"];
    [coder encodeObject:_goalType forKey:@"goalTypeSelected"];
    [coder encodeInteger:_goalLimit forKey:@"goalLimit"];
    //[coder encodeObject:_goalCurrent forKey:@"goalCurrent"];
    //[ coder encodeObject: self.getCurrentCompleted forKey:@"something"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [self init];
    
    if(self){
        _goalName = [decoder decodeObjectForKey:@"userGoalName"];
        _imageName = [decoder decodeObjectForKey:@"imageName"];
        _goalType = [decoder decodeObjectForKey:@"goalTypeSelected"];
        _goalLimit = [decoder decodeIntForKey:@"goalLimit"];
        //_goalCurrent = [decoder decodeObjectForKey:@"goalCurrent"];
    }
    return self;
}


@end
