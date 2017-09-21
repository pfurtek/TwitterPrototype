//
//  RetweetSectionController.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import Foundation
import IGListKit

class RetweetSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {
    
    var item: Tweet?
    
    var isWorkingRange: Bool = false
    
    override init() {
        super.init()
        workingRangeDelegate = self
    }
    
    func numberOfItems() -> Int {
        return 1
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width: CGFloat = collectionContext!.containerSize.width
        let height: CGFloat = 20
        return CGSize(width: width, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(withNibName: "RetweetCollectionViewCell", bundle: nil, for: self, at: index) as! RetweetCollectionViewCell
        
        cell.setCell(for: self.item!)
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.item = object as? Tweet
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
