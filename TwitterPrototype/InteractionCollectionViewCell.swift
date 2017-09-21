//
//  InteractionCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class InteractionCollectionViewCell: UICollectionViewCell {
    
    var tweet: Tweet?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func likeClicked(_ sender: Any) {
    }
    @IBAction func commentClicked(_ sender: Any) {
    }
    @IBAction func shareClicked(_ sender: Any) {
    }

    func setCell(for tweet: Tweet) {
        self.tweet = tweet
    }
}
