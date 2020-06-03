//
//  MainViewController.h
//  NameThatPet
//
//  Created by Vui Nguyen on 1/7/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

#pragma mark - Public, to be accessed by the class's Swift extension
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;

@end

