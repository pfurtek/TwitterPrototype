//
//  InteractionSectionController.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/1/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import Foundation
import IGListKit

class InteractionSectionController: IGListSectionController, IGListSectionType, IGListWorkingRangeDelegate {
    
    var item: Tweet?
    
    var isWorkingRange: Bool = false
    
    override init() {
        super.init()
        workingRangeDelegate = self
    }
    
    func numberOfItems() -> Int {
        if self.isLastSection {
            return 1
        }
        return 2
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        if index == 1 {
            let width: CGFloat = collectionContext!.containerSize.width
            let height: CGFloat = 0.3
            return CGSize(width: width, height: height)
        }
        let width: CGFloat = collectionContext!.containerSize.width
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        if index == 1 {
            let cell = collectionContext!.dequeueReusableCell(withNibName: "SeparatorCollectionViewCell", bundle: nil, for: self, at: index) as! SeparatorCollectionViewCell
            
            cell.setCell(with: .lightGray)
            
            return cell
        }
        let cell = collectionContext!.dequeueReusableCell(withNibName: "InteractionCollectionViewCell", bundle: nil, for: self, at: index) as! InteractionCollectionViewCell
        
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
