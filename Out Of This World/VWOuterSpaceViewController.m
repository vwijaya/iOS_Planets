//
//  VWOuterSpaceViewController.m
//  Out Of This World
//
//  Created by Valerino on 3/28/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import "VWOuterSpaceViewController.h"
#import "AstronomicalData.h"
#import "VWSpaceObject.h"
#import "VWSpageImageViewController.h"
#import "VWSpaceDataViewController.h"

@interface VWOuterSpaceViewController ()

@end

@implementation VWOuterSpaceViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSMutableDictionary *planetData in [AstronomicalData allKnownPlanets])
    {
        NSString *imgName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        VWSpaceObject *planet = [[VWSpaceObject alloc]
                                 initWithData:planetData
                                 andImage:[UIImage imageNamed:imgName]];
        [self.planets addObject:planet];
    }
    
    
    
    //self.planets = [[NSMutableArray alloc] init];
    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
//    
//    self.planets = [[NSMutableArray alloc] initWithObjects:planet1, planet2, planet3, planet4, planet5,
//                    planet6, planet7, planet8, nil];
    
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
//    [self.planets addObject:planet5];
//    [self.planets addObject:planet6];
//    [self.planets addObject:planet7];
//    [self.planets addObject:planet8];
    
//    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
//    [myDictionary setObject:@"red" forKey:@"firetruck color"];
//    [myDictionary setObject:@"blue" forKey:@"ocean color"];
//    [myDictionary setObject:@"yellow" forKey:@"star color"];
//    NSLog(@"%@", myDictionary);
//    
//    NSString *blueString = [myDictionary objectForKey:@"ocean color"];
//    NSLog(@"%@", blueString);
}

// For passing data forward - lecture 132
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //NSLog(@"%@", sender);
    
    // Introspection
    if([sender isKindOfClass:[UITableViewCell class]])
    {
        if([segue.destinationViewController isKindOfClass:[VWSpageImageViewController class]])
        {
            VWSpageImageViewController *nextVC = segue.destinationViewController;
            
            NSIndexPath *path = [self.tableView indexPathForCell:sender];
            VWSpaceObject *selectedObject;
            if(path.section == 0) {
                selectedObject = self.planets[path.row];
            } else if(path.section == 1) {
                selectedObject = self.addedSpaceObjects[path.row];
            }
            //VWSpaceObject *selectedObject = self.planets[path.row];
            
            // Passing information to Proxy Properties: nextVC.spaceObject
            nextVC.spaceObject = selectedObject;
            
            // Don't set UI properties inside prepareForSegue (i.e. Passing info to outlets.
            // Example:
            // nextVC.imageView.image = selectedObject.spaceImage;
            
            //NSLog(@"Here: %@", selectedObject);
        }
    }
    
    if([sender isKindOfClass:[NSIndexPath class]])
    {
        if ([segue.destinationViewController isKindOfClass:[VWSpaceDataViewController class]])
        {
            VWSpaceDataViewController *nextVC = segue.destinationViewController;

            NSIndexPath *path = sender; // !!!
            
            VWSpaceObject *selectedObject;
            if(path.section == 0) {
                selectedObject = self.planets[path.row];
            } else if(path.section == 1) {
                selectedObject = self.addedSpaceObjects[path.row];
            }            
            //VWSpaceObject *selectedObject = self.planets[path.row];
            
            nextVC.spaceObject = selectedObject;
        }
    }
    
    if([segue.destinationViewController isKindOfClass:[VWAddSpaceViewController class]])
    {
        VWAddSpaceViewController *addSpaceObjectVC = segue.destinationViewController;
        addSpaceObjectVC.delegate = self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    //return 2;
    if ([self.addedSpaceObjects count]) {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 3;
//    if (section == 0) {
//        return 3;
//    } else {
//        return 2;
//    }
    if (section == 1) {
        return [self.addedSpaceObjects count];
    } else {
        return [self.planets count];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier= @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    //cell.textLabel.text = @"Hellow...My 1st tableview";
    //cell.textLabel.text = [NSString stringWithFormat:@"Row %i", indexPath.row];

//    cell.textLabel.text = [self.planets objectAtIndex:indexPath.row];
//    
//    if (indexPath.section == 0) {
//        cell.backgroundColor = [UIColor redColor];
//    } else {
//        cell.backgroundColor = [UIColor blueColor];
//    }
    if (indexPath.section == 1) {
        VWSpaceObject *planet = [self.addedSpaceObjects objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    } else {
        VWSpaceObject *planet = [self.planets objectAtIndex:indexPath.row];
        cell.textLabel.text = planet.name;
        cell.detailTextLabel.text = planet.nickname;
        cell.imageView.image = planet.spaceImage;
    }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1.0];
    
    return cell;
}

#pragma mark - VWAddSpaceViewControllerDelegate
-(void)didCancel
{
    NSLog(@"didCancel");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addSpaceObject:(VWSpaceObject *)spaceObject
{
    if(!self.addedSpaceObjects)
    {
        self.addedSpaceObjects = [[NSMutableArray alloc] init];
    }
    [self.addedSpaceObjects addObject:spaceObject];
    
    NSLog(@"addSpaceObject");
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"accessory button is working properly %i", indexPath.row);
    [self performSegueWithIdentifier:@"Push to space data" sender:indexPath];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
