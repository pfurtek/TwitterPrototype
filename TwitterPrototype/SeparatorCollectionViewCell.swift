//
//  SeparatorCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/2/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class SeparatorCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(with color: UIColor) {
        self.backgroundColor = color
    }
}
