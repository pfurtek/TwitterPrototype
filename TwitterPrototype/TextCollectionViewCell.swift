//
//  TextCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var textLabel: UILabel!
    
    var tweet: Tweet?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(for tweet: Tweet) {
        self.tweet = tweet
        self.textLabel.text = tweet.text
    }
}
