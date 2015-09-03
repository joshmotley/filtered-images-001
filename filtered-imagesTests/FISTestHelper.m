//
//  FISTestHelper.m
//  filtered-images
//
//  Created by James Campagno on 9/3/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISTestHelper.h"

@implementation FISTestHelper

+ (BOOL)image:(UIImage *)image1 isEqualTo:(UIImage *)image2 {
    NSData *dataOfImage1 = [FISTestHelper createDataObjectWithImage:image1];
    NSData *dataOfImage2 = [FISTestHelper createDataObjectWithImage:image2];
    
    return [dataOfImage1 isEqualToData:dataOfImage2];
}

+ (NSData *)createDataObjectWithImage:(UIImage *)image {
    UIImage *originalImage = image;
    
    CGSize destinationSize = CGSizeMake(25, 25);
    UIGraphicsBeginImageContext(destinationSize);
    [originalImage drawInRect:CGRectMake(0,0,destinationSize.width,destinationSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData *thumbNailimageData = UIImagePNGRepresentation(newImage);
    UIGraphicsEndImageContext();
    return thumbNailimageData;
}

@end