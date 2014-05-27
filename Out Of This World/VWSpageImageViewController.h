//
//  VWSpageImageViewController.h
//  Out Of This World
//
//  Created by Valerino on 5/27/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VWSpaceObject.h"

@interface VWSpageImageViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) VWSpaceObject *spaceObject;

@end
