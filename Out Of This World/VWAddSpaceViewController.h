//
//  VWAddSpaceViewController.h
//  Out Of This World
//
//  Created by Valerino on 5/29/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VWSpaceObject.h"

@protocol VWAddSpaceViewControllerDelegate <NSObject>

@required

-(void)addSpaceObject:(VWSpaceObject *) spaceObject;
-(void)didCancel;

@end

@interface VWAddSpaceViewController : UIViewController

@property (weak, nonatomic) id<VWAddSpaceViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *numberOfMoonsTextField;
@property (strong, nonatomic) IBOutlet UITextField *interestingFactTextField;

- (IBAction)addButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;



@end
