//
//  IncidentFilterCell.swift
//  Neighbors
//
//  Created by Robert Gillett on 2/5/20.
//  Copyright © 2020 Robert Gillett. All rights reserved.
//

import UIKit


class IncidentFilterCell: UICollectionViewCell {
    static var nibReuseId = "IncidentFilterCell"
    static func registerNibCell(_ cv: UICollectionView) {
        cv.register(UINib(nibName:IncidentFilterCell.nibReuseId, bundle: nil), forCellWithReuseIdentifier: IncidentFilterCell.nibReuseId)
    }
    var isSelectedFilter: Bool = false

    @IBOutlet weak var badgeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var item: IncidentFilter!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(_ i: IncidentFilter) {
        self.item = i
        badgeLabel.text = i.badgeValue
        titleLabel.text = i.title
        
        badgeLabel.textColor = isSelected ? UIColor.white : item.color
//        badgeLabel.backgroundColor = isSelected ? item.color : .clear
        titleLabel.textColor = isSelected ? item.color : .systemGray
    }
    
    override var isSelected: Bool {
        didSet {
            badgeLabel.textColor = isSelected ? UIColor.white : item.color
//            badgeLabel.backgroundColor = isSelected ? item.color : .clear
            titleLabel.textColor = isSelected ? item.color : .systemGray
        }
    }
}

