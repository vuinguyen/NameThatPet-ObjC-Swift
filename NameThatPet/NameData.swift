//
//  NameData.swift
//  NameThatPet
//
//  Created by Vui Nguyen on 1/8/18.
//  Copyright © 2018 Sunfish Empire. All rights reserved.
//

import Foundation

extension NameData {
  @objc func random(_ numberOfItems:Int) -> UInt32 {
    return arc4random_uniform(UInt32(numberOfItems))
  }
}
