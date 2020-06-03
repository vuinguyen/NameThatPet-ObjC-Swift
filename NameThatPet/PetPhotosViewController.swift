//
//  PetPhotosViewController.swift
//  NameThatPet
//
//  Created by Vui Nguyen on 1/8/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

import UIKit

class PetPhotosViewController: UICollectionViewController {
  // MARK: Properties
  fileprivate let reuseIdentifier = "PetPhotoCell"
  fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
  fileprivate let itemsPerRow: CGFloat = 3
  fileprivate let numberOfImages = 12

  var selectedImage: UIImage?

  // MARK: Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "SelectPetPhoto" else {
      return
    }

    if let upcoming = segue.destination as? MainViewController  {
      upcoming.animalImageView.image = selectedImage
    }
  }
}

// MARK: Private
private extension PetPhotosViewController {
  func getUIImage(_ forIndexPath: IndexPath) -> UIImage {
    let image = UIImage(named: "ImagePet\(forIndexPath.row)")
    return image!
  }
}

// MARK: UICollectionViewDataSource
extension PetPhotosViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numberOfImages
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PetPhotoCell
    cell.backgroundColor = .lightGray
    cell.imageView.image = getUIImage(indexPath)
    return cell
  }
}

// MARK: UICollectionViewDelegate
extension PetPhotosViewController {
  override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    selectedImage = getUIImage(indexPath)
    return true
  }
}

// MARK: UICollectionViewDelegateFlowLayout
extension PetPhotosViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {

    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    let heightPerItem = widthPerItem * 1.30
    return CGSize(width: widthPerItem, height: heightPerItem)
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }

  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
}

