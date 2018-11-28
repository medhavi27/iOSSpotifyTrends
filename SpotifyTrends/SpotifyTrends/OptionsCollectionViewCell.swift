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
        sortBy.font = UIFont(name: sortBy.font.fontName, size: 11)
        sortBy.backgroundColor = .white
        contentView.addSubview(sortBy)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            sortBy.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sortBy.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            sortBy.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 50 ),
            sortBy.heightAnchor.constraint(equalToConstant: 55)
            ])
        super.updateConstraints()
    
        func configure(for option: Options) {
            sortBy.text = option.rawValue
        }
    

}
}