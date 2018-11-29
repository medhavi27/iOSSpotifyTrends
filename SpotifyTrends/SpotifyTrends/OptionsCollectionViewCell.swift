//
//  OptionsCollectionViewCell.swift
//  SpotifyTrends
//
//  Created by Medhavi Gandhi on 11/26/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {
    var sortBy: UILabel!
    let padding: CGFloat = 8
    
    enum Options: String, CaseIterable {
        case threemonths = "Last 3 Months"
        case sixmonths = "Last 6 Months"
        case year = "Last Year"
        case random = "Random"
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        sortBy = UILabel()
        sortBy.translatesAutoresizingMaskIntoConstraints = false
        sortBy.font = UIFont(name: sortBy.font.fontName, size: 20)
        sortBy.backgroundColor = .black
        sortBy.textColor = .white
        sortBy.textAlignment = .center
        contentView.addSubview(sortBy)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            sortBy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            sortBy.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            sortBy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sortBy.heightAnchor.constraint(equalTo: contentView.heightAnchor)
            ])
        
        
        super.updateConstraints()
}
    
    func configure(for option: Options) {
        sortBy.text = option.rawValue
    }
}
