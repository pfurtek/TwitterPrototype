//
//  RetweetCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class RetweetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var retweetLabel: UILabel!
    
    var tweet: Tweet?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(for tweet: Tweet) {
        self.tweet = tweet
        self.retweetLabel.text = "\(tweet.retweetUsername!) retweeted"
    }
}
