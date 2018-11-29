//
//  HomeNavViewController.swift
//  SpotifyTrends
//
//  Created by Medhavi Gandhi on 11/26/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit

class HomeNavViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout {

    var optionsCollectionView: UICollectionView!
    var optionsArray: [OptionsCollectionViewCell.Options] = []
    
    let optionsReuseIdentifer = "optionsReuse"
    let padding: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Home"
        
        optionsArray = [OptionsCollectionViewCell.Options.threemonths, OptionsCollectionViewCell.Options.sixmonths, OptionsCollectionViewCell.Options.year, OptionsCollectionViewCell.Options.random ]
        
        let layout = UICollectionViewFlowLayout()
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        optionsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        optionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        optionsCollectionView.backgroundColor = .black
        optionsCollectionView.dataSource = self
        optionsCollectionView.delegate = self
        optionsCollectionView.register(OptionsCollectionViewCell.self, forCellWithReuseIdentifier: optionsReuseIdentifer)
        view.addSubview(optionsCollectionView)
        // Do any additional setup after loading the view.
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            optionsCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            optionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            optionsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            optionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: optionsReuseIdentifer, for: indexPath) as! OptionsCollectionViewCell
        let option = optionsArray[indexPath.item]
        cell.configure(for: option)
        cell.needsUpdateConstraints()
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.white.cgColor
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want || padding IMAGE padding IMAGE padding ||
            let length = (collectionView.frame.width - padding * 3) / 2.0
            let height = (collectionView.frame.height - padding * 3) / 2.0
            return CGSize(width: length, height: height)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
