//
//  RewardCollectionViewController.h
//  habitApp
//
//  Created by Cameron Johns on 2016-03-02.
//  Copyright (c) 2016 Cameron Johns. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RewardCollectionViewController : UICollectionViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *image;

@property (strong, nonatomic) NSMutableArray *rewardImages;

@end
