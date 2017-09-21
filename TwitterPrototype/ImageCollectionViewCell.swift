//
//  ImageCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
    var tweet: Tweet?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(for tweet: ImageTweet) {
        self.tweet = tweet
        self.imageView.image = tweet.image
    }
}
