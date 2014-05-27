//
//  VWSpaceObject.h
//  Out Of This World
//
//  Created by Valerino on 5/11/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VWSpaceObject : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravitationalForce;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestFact;

@property (strong, nonatomic) UIImage *spaceImage;

-(id)initWithData:(NSDictionary *) data andImage:(UIImage *) image;


@end
