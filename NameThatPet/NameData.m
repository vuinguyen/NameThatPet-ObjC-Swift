//
//  NameData.m
//  NameThatPet
//
//  Created by Vui Nguyen on 1/7/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

#import "NameData.h"

// Need the import below to use Swift functions
#import "NameThatPet-Swift.h"

static const int NumberOfAnimalImages = 12;

@interface NameData()

#pragma mark - Private properties
@property (nonatomic) NSArray *unisexTitles;
@property (nonatomic) NSArray *maleTitles;
@property (nonatomic) NSArray *femaleTitles;
@property (nonatomic) NSArray *randomTitles;
@property (nonatomic) NSDictionary *titleDictionary;

@property (nonatomic) NSArray *personalNames;
@property (nonatomic) NSArray *familyNames;
@property (nonatomic) NSArray *suffixes;

@end

@implementation NameData

#pragma mark - Lifecycle
-(id)init {
  self = [super init];
  _titleCategories = @[@"Random", @"Unisex", @"Male", @"Female"];

  _unisexTitles = @[@"Dr.", @"Professor", @"Honorable", @"Captain", @"Staff Sergeant", @"General", @"Reverend", @"Deacon"];
  _maleTitles = _maleTitles = @[@"Mr.", @"His Highness", @"His Majesty", @"Count", @"Viscount", @"Duke", @"His Holiness"];
  _femaleTitles = @[@"Mrs.", @"Ms.", @"Her Highness", @"Her Majesty", @"Countess", @"Duchess", @"Her Holiness"];
  _randomTitles = [[_unisexTitles arrayByAddingObjectsFromArray: _maleTitles] arrayByAddingObjectsFromArray: _femaleTitles];

  _titleDictionary = @{_titleCategories[0]: _randomTitles, _titleCategories[1]: _unisexTitles,
                       _titleCategories[2]: _maleTitles, _titleCategories[3]: _femaleTitles};

  _personalNames = @[@"Goofy", @"Silly", @"Fur", @"Smelly", @"Tiny", @"Pretty", @"Lazy", @"Stinky", @"Ugly", @"Furry",
                     @"Peanut", @"Kissy", @"Barky", @"Bear", @"Nosy", @"Smarty"];
  _familyNames = @[@"Pants", @"Butt", @"Ball", @"McPants", @"Face", @"Ears", @"Fur", @"Feet", @"Foose", @"Snout",
                   @"Tail", @"Lips"];
  _suffixes = @[@"PhD", @"McGee", @"Esquire", @"Junior", @"II", @"III", @"O.B.E.", @"J.D.", @"M.D.",
                @"legion d'honneur", @"K.B.", @"McButt"];

  return self;
}

#pragma mark - Public
-(NSString *) randomPetName:(NSString *)titleCategory includeSuffix:(BOOL)includeSuffix {
  NSString *randomName = @"Random String";
  int randomNumber;
  NSArray *values;

  // Grab a random title
  NSArray *keys = [self.titleDictionary allKeys];
  for (int i = 0; i < keys.count; i++) {
    if ([titleCategory isEqualToString: keys[i]]) {
      values = [self.titleDictionary objectForKey: keys[i]];
      randomNumber = arc4random_uniform((uint32_t)[values count]);
      randomName = values[randomNumber];
      break;
    }
  }

  // Grab a random personal name
  randomNumber = arc4random_uniform((uint32_t)[self.personalNames count]);
  randomName = [randomName stringByAppendingString: @" "];
  randomName = [randomName stringByAppendingString: self.personalNames[randomNumber]];

  // Grab a random family name
  randomNumber = arc4random_uniform((uint32_t)[self.familyNames count]);
  randomName = [randomName stringByAppendingString: @" "];
  randomName = [randomName stringByAppendingString: self.familyNames[randomNumber]];

  // Grab a random suffix, if applicable
  if (includeSuffix) {
    randomNumber = arc4random_uniform((uint32_t)[self.suffixes count]);
    randomName = [randomName stringByAppendingString: @", "];
    randomName = [randomName stringByAppendingString: self.suffixes[randomNumber]];
  }
  return randomName;
}

-(NSString *) randomImageName {
  NSString *imageName = @"ImagePet";
  // You can optionally use the more syntax friendly Swift wrapper of the arc4random function,
  // defined in NameData.swift, as shown here.
  //int randomNumber = arc4random_uniform((uint32_t)NumberOfAnimalImages);
  int randomNumber = [self random: NumberOfAnimalImages];

  imageName = [imageName stringByAppendingString: @(randomNumber).stringValue];
  return imageName;
}

@end
