//
//  AppLayouts.swift
//  Shorts
//
//  Created by SHAYANUL HAQ SADI on 7/9/23.
//

import UIKit


class AppLayouts {
    static let shared = AppLayouts()
    
    private init() { }
    
    func createPlayerSection() -> NSCollectionLayoutSection {
        print("Player section")
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
                
        
//        section.contentInsetsReference = .none
//        section.orthogonalScrollingBehavior = .groupPagingCentered
        
//        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .absolute(10))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: SupplementraryHeaderFooter.headerElementKind, alignment: .topLeading)
//        let footerWithPager = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize, elementKind: SupplementraryHeaderFooter.footerElementWithPagerKind, alignment: .bottomLeading)
//        section.boundarySupplementaryItems = [footerWithPager] //, footer
        
//        section.visibleItemsInvalidationHandler = { (items, scrollOffset, environment) in
//            items.forEach { item in
//                let distanceFromCenter = abs((item.frame.midX - scrollOffset.x) - environment.container.contentSize.width / 2.0)
//                let minScale: CGFloat = 0.8
//                let maxScale: CGFloat = 1.0 - (distanceFromCenter / environment.container.contentSize.width)
//                let scale = max(maxScale, minScale)
//                item.transform = CGAffineTransform(scaleX: scale, y: scale)
//            }
//        }
        
        return section
    }

}
