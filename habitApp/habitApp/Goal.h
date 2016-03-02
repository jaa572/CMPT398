//
//  Goal.h
//  habitApp
//
//  Created by Cameron Johns on 2016-02-27.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goal : NSObject

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

@property NSString* imageName;
@property NSString* goalName;
@property NSInteger goalLimit;
@property NSInteger goalStart;
@property NSDate* startDate;
@property NSDate* endDate;

@end
