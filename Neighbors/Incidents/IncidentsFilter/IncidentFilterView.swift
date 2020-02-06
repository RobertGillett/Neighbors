//
//  IncidentFilterView.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import Foundation
import UIKit

class IncidentFilterView: UIView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    enum Section: CaseIterable {
        case main
    }
    var dataSource: UICollectionViewDiffableDataSource<Section, IncidentFilter>!
    var items : [IncidentFilter] = []
    let cellHeight: CGFloat = 50
    let attributedCellText = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]
    
        lazy var collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.backgroundColor = .clear
            cv.delegate = self
            return cv
        }()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            IncidentFilterCell.registerNibCell(self.collectionView)
            addSubview(collectionView)
            collectionView.constrainToParent()
            self.collectionView.isScrollEnabled = true
            self.collectionView.isDirectionalLockEnabled = true
            self.collectionView.showsVerticalScrollIndicator = false
            self.collectionView.showsHorizontalScrollIndicator = false
            self.collectionView.allowsMultipleSelection = true
            self.configureDataSource()
        
        }
    
    func setup() {
        var items = IncidentType.allCases.map({ IncidentFilter(title: $0.rawValue, color: $0.color, field: $0.rawValue, fieldValue: $0.rawValue)})
        items.insert(IncidentFilter(title: "All", color: UIColor.systemIndigo, field: "All", fieldValue: "All"), at: 0)
        self.items = items
        var snapshot = NSDiffableDataSourceSnapshot<Section, IncidentFilter>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
        func configureDataSource() {
            dataSource = UICollectionViewDiffableDataSource
                <Section, IncidentFilter>(collectionView: self.collectionView) {
                    (collectionView: UICollectionView, indexPath: IndexPath,
                    menu: IncidentFilter) -> UICollectionViewCell? in
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IncidentFilterCell.nibReuseId, for: indexPath) as! IncidentFilterCell
                    cell.configure(menu)
                return cell
            }
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let item = self.dataSource.itemIdentifier(for: indexPath)
            var w: CGFloat = 0
                let width = item?.title.size(withAttributes: self.attributedCellText).width ?? 0
                w = width + 20
            return CGSize(width: w, height: self.cellHeight)
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 4
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
}
