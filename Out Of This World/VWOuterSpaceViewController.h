//
//  VWOuterSpaceViewController.h
//  Out Of This World
//
//  Created by Valerino on 3/28/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VWAddSpaceViewController.h"

@interface VWOuterSpaceViewController : UITableViewController <VWAddSpaceViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableArray *addedSpaceObjects;

@end
