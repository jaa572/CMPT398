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

-(void)setGoalName:(NSString*) name{
    _goalName = name;
}

-(void)setImageName:(NSString*) image{
    _imageName = image;
}

-(void)setGoalType2:(NSString *)goalSelected{
    _goalType2 = goalSelected;
}

-(NSString*)getGoalName{
    return _goalName;
}

-(NSString*)getImageName{
    return _imageName;
}

-(void)increaseGoalStart{
    _goalStart += 1;
}


-(NSString*) getPropertyListPath{
    NSURL *documentDir = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *plist = [documentDir URLByAppendingPathComponent:@"goalList2.plist"];
    return plist.path;
}


- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_goalName forKey:@"userGoalName"];
    [coder encodeObject:_imageName forKey:@"imageName"];
    [coder encodeObject:_goalType2 forKey:@"goalTypeSelected"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [self init];
    
    if(self){
        _goalName = [decoder decodeObjectForKey:@"userGoalName"];
        _imageName = [decoder decodeObjectForKey:@"imageName"];
        _goalType2 = [decoder decodeObjectForKey:@"goalTypeSelected"];
    }
    return self;
}


@end
