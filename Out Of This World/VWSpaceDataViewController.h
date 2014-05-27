//
//  VWSpaceDataViewController.h
//  Out Of This World
//
//  Created by Valerino on 5/27/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VWSpaceObject.h"

@interface VWSpaceDataViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) VWSpaceObject *spaceObject;


@end
