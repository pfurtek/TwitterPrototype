//
//  TweetModel.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import Foundation
import UIKit
import IGListKit

class Tweet {
    var retweet: Bool
    var retweetUsername: String?
    var user: TweetUser
    var text: String
    var id: Int
    
    init(user: TweetUser, text: String, id: Int, retweet: Bool = false) {
        self.user = user
        self.text = text
        self.id = id
        self.retweet = retweet
    }
}

class TextTweet: Tweet {
    
}

class ImageTweet: Tweet {
    var image: UIImage?
    var imageURL: URL?
    
    init(user: TweetUser, text: String, image: UIImage, id: Int, retweet: Bool = false) {
        super.init(user: user, text: text, id: id, retweet: retweet)
        self.image = image
    }
    
    init(user: TweetUser, text: String, imageURL: String, id: Int, retweet: Bool = false) {
        super.init(user: user, text: text, id: id, retweet: retweet)
        self.imageURL = URL(string: imageURL)
    }
}

class LinkTweet: Tweet {
    var link: TweetLink
    
    init(user: TweetUser, text: String, link: TweetLink, id: Int, retweet: Bool = false) {
        self.link = link
        super.init(user: user, text: text, id: id, retweet: retweet)
    }
}

class TweetUser {
    var avatarURL: URL?
    var avatarImage: UIImage? = nil
    var name: String
    var username: String
    
    init(name: String, username: String) {
        self.name = name
        self.username = username
    }
    
    convenience init(name: String, username: String, url: String) {
        self.init(name: name, username: username)
        self.avatarURL = URL(string: url)
    }
    
    convenience init(name: String, username: String, image: UIImage) {
        self.init(name: name, username: username)
        self.avatarImage = image
    }
    
    func isEqual(to user: TweetUser) -> Bool {
        if self.avatarImage == user.avatarImage,
            self.avatarURL == user.avatarURL,
            self.name == user.name,
            self.username == user.username {
            return true
        }
        return false
    }
}

class TweetLink {
    var linkURL: URL?
    var linkTitle: String
    var linkDescription: String
    var linkString: String
    var linkImage: UIImage?
    var linkImageURL: URL?
    
    init(url: String, title: String, description: String, imageURL: String = "", image: UIImage? = nil) {
        self.linkURL = URL(string: url)
        self.linkTitle = title
        self.linkDescription = description
        self.linkString = url
        self.linkImageURL = URL(string: imageURL)
        self.linkImage = image
    }
}

extension UIImage {
    func download(fromURL url: URL) {
        
    }
}

extension Tweet: IGListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let obj = object as? Tweet else {
            return false
        }
        if !obj.user.isEqual(to: self.user) {
            return false
        }
        if obj.text != self.text {
            return false
        }
        if obj.retweet != self.retweet {
            return false
        }
        if obj.id != self.id {
            return false
        }
        return true
    }
}
