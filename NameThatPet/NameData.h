//
//  NameData.h
//  NameThatPet
//
//  Created by Vui Nguyen on 1/7/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

#ifndef NameData_h
#define NameData_h

#import <Foundation/Foundation.h>

@interface NameData: NSObject

@property (nonatomic) NSArray *titleCategories;

-(id)init;

#pragma mark - Public
-(NSString *) randomPetName:(NSString *)titleCategory includeSuffix:(BOOL)includeSuffix;
-(NSString *) randomImageName;

@end

#endif /* NameData_h */
