//
//  EmbeddedSectionController.swift
//  TwitterPrototype
//
//  Created by Pawel Furtek on 8/8/17.
//  Copyright © 2017 Pawel Furtek. All rights reserved.
//

import Foundation
import IGListKit

class EmbeddedSectionController: IGListSectionController, IGListSectionType, IGListAdapterDataSource {
    
    lazy var adapter: IGListAdapter = {
        let adapter = IGListAdapter(updater: IGListAdapterUpdater(),
                                    viewController: self.viewController,
                                    workingRangeSize: 0)
        adapter.dataSource = self
        return adapter
    }()
    
    var items: IGListArray?
    
    func numberOfItems() -> Int {
        return (banner != nil && banner!.types.count > 0) ? 1 : 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: collectionContext!.containerSize.width/3.5)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: EmbeddedCollectionViewCell.self, for: self, at: index) as! EmbeddedCollectionViewCell
        
        
        
        adapter.collectionView = cell.collectionView
        
        adapter.collectionView?.scrollToItem(at: IndexPath(row: 0, section: 0), at: UICollectionViewScrollPosition.left, animated: false)
        
        _ = cell.addBorder(edges: .bottom, color: .lightGray, thickness: 0.5)
        
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.items = object as? IGListArray
        adapter.performUpdates(animated: true, completion: nil)
    }
    
    func didSelectItem(at index: Int) {}
    
    
    //MARK: IGListAdapterDataSource
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
        return self.items.items
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
        return TypeSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? {
        return nil
    }
    
}
