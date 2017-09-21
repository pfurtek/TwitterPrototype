//
//  ViewController.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 3)
    }()
    
    let collectionView: IGListCollectionView = {
        let flow = UICollectionViewFlowLayout()
        return IGListCollectionView(frame: .zero, collectionViewLayout: flow)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupCollectionView() {
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.collectionView.refreshControl = refresher
    }
    
    func refresh() {
        self.collectionView.refreshControl?.endRefreshing()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let frame = view.bounds
        collectionView.frame = frame
        collectionView.layoutSubviews()
    }
    
}

extension ViewController: IGListAdapterDataSource {
    // MARK: - IGListAdapterDataSource
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        var sections: [IGListSectionController] = []
        if (object as? Tweet)?.retweet ?? false {
            sections.append(RetweetSectionController())
        }
        sections.append(UserinfoSectionController())
        switch object {
            case is ImageTweet:
                sections.append(ImageSectionController())
                break
            case is LinkTweet:
                sections.append(LinkSectionController())
                break
            case is TextTweet: break
            default: break
        }
        if !((object as? Tweet)?.text.isEmpty ?? true) {
            sections.append(TextSectionController())
        }
        sections.append(InteractionSectionController())
        return IGListStackedSectionController(sectionControllers: sections)!
    }
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        var objects: [IGListDiffable] = []
        
        let images: [UIImage] = [#imageLiteral(resourceName: "test1"), #imageLiteral(resourceName: "test2"), #imageLiteral(resourceName: "test3"), #imageLiteral(resourceName: "test4"), #imageLiteral(resourceName: "test5")]
        let users: [TweetUser] = [TweetUser(name: "Pawel Furtek", username: "pawel", image: #imageLiteral(resourceName: "avatar1")),
                                  TweetUser(name: "Test Tester", username: "tester", image: #imageLiteral(resourceName: "avatar2")),
                                  TweetUser(name: "Jan Wiosna", username: "wiosna", image: #imageLiteral(resourceName: "avatar3"))]
        let links: [TweetLink] =
                                 [TweetLink(url: "http://swimswam.com", title: "SwimSwam", description: "Webpage with swimming-related news and updates.", image: #imageLiteral(resourceName: "link2")),
                                  TweetLink(url: "http://www.3good.co", title: "3Good", description: "3 good to be true!"),
                                  TweetLink(url: "http://www.usc.edu", title: "University of Southern California", description: "This link will direct you to the webpage of the greatest school in the world.", image: #imageLiteral(resourceName: "link3")),
                                  TweetLink(url: "http://www.testpage.com", title: "Test link", description: "This is the longest description, consisting of many details and words that mostly wouldn't be necessary to describe the link, but someone decided they will go here anyway, allowing us to test the cell thoroughly and see how it behaves with a longer description.")]
        let text = "Lorem ipsum dolor sit amet, ligula suspendisse nulla pretium, rhoncus tempor fermentum, enim integer ad vestibulum volutpat. Nisl rhoncus turpis est, vel elit, congue wisi enim nunc ultricies sit, magna tincidunt. Maecenas aliquam maecenas ligula nostra, accumsan taciti. Sociis mauris in integer, a dolor netus non dui aliquet, sagittis felis sodales, dolor sociis mauris, vel eu libero cras. Faucibus at. Arcu habitasse elementum est, ipsum purus pede porttitor class, ut adipiscing, aliquet sed auctor, imperdiet arcu per diam dapibus libero duis."// Enim eros in vel, volutpat nec pellentesque leo, temporibus scelerisque nec. Ac dolor ac adipiscing amet bibendum nullam, lacus molestie ut libero nec, diam et, pharetra sodales, feugiat ullamcorper id tempor id vitae. Mauris pretium aliquet, lectus tincidunt. Porttitor mollis imperdiet libero senectus pulvinar. Etiam molestie mauris ligula laoreet, vehicula eleifend. Repellat orci erat et, sem cum, ultricies sollicitudin amet eleifend dolor nullam erat, malesuada est leo ac. Varius natoque turpis elementum est. Duis montes, tellus lobortis lacus amet arcu et. In vitae vel, wisi at, id praesent bibendum libero faucibus porta egestas, quisque praesent ipsum fermentum tempor. Curabitur auctor, erat mollis sed, turpis vivamus a dictumst congue magnis. Aliquam amet ullamcorper dignissim molestie, mollis. Tortor vitae tortor eros wisi facilisis."
        
        
        let tweet0 = TextTweet(user: users[0], text: text, id: 0)
        let tweet1 = ImageTweet(user: users[1], text: text, image: images[0], id: 1, retweet: true)
            tweet1.retweetUsername = "binh"
        let tweet8 = LinkTweet(user: users[2], text: text, link: links[0], id: 8)
        let tweet9 = LinkTweet(user: users[0], text: text, link: links[1], id: 9, retweet: true)
            tweet9.retweetUsername = "luca"
        let tweet5 = ImageTweet(user: users[2], text: text, image: images[2], id: 5, retweet: true)
            tweet5.retweetUsername = "ninoy"
        let tweet6 = TextTweet(user: users[0], text: text, id: 6, retweet: true)
            tweet6.retweetUsername = "binh"
        let tweet10 = LinkTweet(user: users[1], text: text, link: links[2], id: 10)
        let tweet11 = LinkTweet(user: users[2], text: text, link: links[3], id: 11)
        
        
        objects = [tweet0, tweet1, tweet8, tweet9, tweet5, tweet6, tweet10, tweet11]
        
        return objects
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        let view = UILabel()
        view.text = "No latest\nthings to\nexplore yet!"
        view.numberOfLines = 0
        view.font = UIFont(name: "Georgia", size: 24)
        view.textColor = .darkGray
        view.textAlignment = .center
        return view
    }
}

