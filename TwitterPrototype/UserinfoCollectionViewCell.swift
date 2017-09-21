//
//  UserinfoCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class UserinfoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatar: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    var tweet: Tweet?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var frame: CGRect {
        didSet {
            self.avatar?.addRoundedCorners(corners: .allCorners, radius: self.frame.size.height/2)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.avatar.addRoundedCorners(corners: .allCorners, radius: self.frame.size.height/2)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.avatar.addRoundedCorners(corners: .allCorners, radius: self.frame.size.height/2)
    }
    
    func setCell(for tweet: Tweet) {
        self.tweet = tweet
        self.avatar.setImage(tweet.user.avatarImage, for: .normal)
        self.nameLabel.text = tweet.user.name
        self.usernameLabel.text = tweet.user.username
        self.layoutIfNeeded()
    }

}
