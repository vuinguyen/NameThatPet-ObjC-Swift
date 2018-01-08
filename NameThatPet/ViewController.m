//
//  ViewController.m
//  NameThatPet
//
//  Created by Vui Nguyen on 1/7/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

#import "ViewController.h"
#import "NameData.h"

@interface ViewController ()

#pragma mark - Private IBOutlet properties
@property (weak, nonatomic) IBOutlet UIPickerView *titlePicker;
@property (weak, nonatomic) IBOutlet UISwitch *suffixSwitch;
@property (weak, nonatomic) IBOutlet UILabel *generatedNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *animalImageView;

@end

@implementation ViewController

#pragma mark - Private
NSArray *titlePickerData;
NSInteger selectedRow;
NameData *nameData;

#pragma mark - IBActions
- (IBAction)generateName:(id)sender {
  NSString *randomName = [nameData randomPetName:titlePickerData[selectedRow] includeSuffix:self.suffixSwitch.isOn];
  self.generatedNameLabel.text = randomName;
  self.animalImageView.image = [UIImage imageNamed:[nameData randomImageName]];
}

#pragma mark - Lifecycle
- (void)viewDidLoad {
  [super viewDidLoad];

  // Initialize Data
  nameData = [[NameData alloc]init];
  titlePickerData = [nameData titleCategories];

  // Connect Data
  self.titlePicker.dataSource = self;
  self.titlePicker.delegate = self;
}

#pragma mark - Protocol Conformance
#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView {
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return titlePickerData.count;
}

#pragma mark - UPPickerViewDelegate
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  return titlePickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  selectedRow = row;
}

@end

