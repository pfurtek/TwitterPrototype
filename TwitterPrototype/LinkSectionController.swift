//
//  LinkSectionController.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import Foundation
import IGListKit

class LinkSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {
    
    var item: LinkTweet?
    
    var isWorkingRange: Bool = false
    
    override init() {
        super.init()
        workingRangeDelegate = self
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        if self.item?.link.linkImage != nil {
            let width: CGFloat = collectionContext!.containerSize.width
            let height: CGFloat = 215
            return CGSize(width: width, height: height)
        }
        let width: CGFloat = collectionContext!.containerSize.width
        let height: CGFloat = 100
        return CGSize(width: width, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        if self.item?.link.linkImage != nil {
            let cell = collectionContext!.dequeueReusableCell(withNibName: "LinkImageCollectionViewCell", bundle: nil, for: self, at: index) as! LinkImageCollectionViewCell
            
            cell.setCell(for: self.item!)
            
            return cell
        }
        
        let cell = collectionContext!.dequeueReusableCell(withNibName: "LinkCollectionViewCell", bundle: nil, for: self, at: index) as! LinkCollectionViewCell
        
        cell.setCell(for: self.item!)
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.item = object as? LinkTweet
    }
    
    func didSelectItem(at index: Int) {
    }
    
    //MARK: IGListWorkingRangeDelegate
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerWillEnterWorkingRange sectionController: IGListSectionController) {
        self.isWorkingRange = true
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerDidExitWorkingRange sectionController: IGListSectionController) {
        self.isWorkingRange = false
    }
}
