//
//  ViewController.swift
//  NameThatPet
//
//  Created by Vui Nguyen on 1/8/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

import UIKit

extension ViewController {
  // MARK: IBActions
  @IBAction func cancelToRWTViewController(_ segue: UIStoryboardSegue) {
  }

  @IBAction func selectPetPhoto(_ segue: UIStoryboardSegue) {
    if let petPhotosViewController = segue.source as? PetPhotosViewController {
      animalImageView.image = petPhotosViewController.selectedImage
    }
  }
}

