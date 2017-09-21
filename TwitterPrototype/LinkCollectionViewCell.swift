//
//  LinkCollectionViewCell.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit

class LinkCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!
    
    var tweet: LinkTweet?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var frame: CGRect {
        didSet {
            self.containerView?.addRoundedCorners(corners: .allCorners, radius: 5, color: .lightGray, width: 0.5)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView?.addRoundedCorners(corners: .allCorners, radius: 5, color: .lightGray, width: 0.5)
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        self.containerView?.addRoundedCorners(corners: .allCorners, radius: 5, color: .lightGray, width: 0.5)
    }

    @IBAction func linkClicked(_ sender: Any) {
    }
    
    func setCell(for tweet: LinkTweet) {
        self.tweet = tweet
        self.titleLabel.text = tweet.link.linkTitle
        self.descriptionLabel.text = tweet.link.linkDescription
        self.linkLabel.text = tweet.link.linkString
        self.layoutIfNeeded()
    }
}
