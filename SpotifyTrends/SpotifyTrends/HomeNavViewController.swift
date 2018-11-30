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
    var textLabel: UIImageView!
    
    let optionsReuseIdentifer = "optionsReuse"
    let padding: CGFloat = 10
    let heighpadding: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        title = "Home"
        
        optionsArray = [OptionsCollectionViewCell.Options.threemonths, OptionsCollectionViewCell.Options.sixmonths, OptionsCollectionViewCell.Options.year, OptionsCollectionViewCell.Options.random ]
        
        let layout = UICollectionViewFlowLayout()
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = 2*padding
        optionsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        optionsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        optionsCollectionView.backgroundColor = .black
        optionsCollectionView.dataSource = self
        optionsCollectionView.delegate = self
        optionsCollectionView.register(OptionsCollectionViewCell.self, forCellWithReuseIdentifier: optionsReuseIdentifer)
        textLabel = UIImageView()
        let image2 = UIImage(named: "spotifytr2")
        textLabel = UIImageView(image: image2)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        textLabel.text = "Choose a Time Period"
//        textLabel.textColor = UIColor(red: 26.0/255, green: 164.0/255, blue: 80.0/255, alpha: 1.0)
//        textLabel.font = UIFont(name: (textLabel.font?.fontName)!, size: 30)
//        textLabel.backgroundColor = .black
        view.addSubview(optionsCollectionView)
        view.addSubview(textLabel)
        // Do any additional setup after loading the view.
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            optionsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            optionsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            optionsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            optionsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 520),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textLabel.heightAnchor.constraint(equalToConstant: 300),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return optionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: optionsReuseIdentifer, for: indexPath) as! OptionsCollectionViewCell
        let option = optionsArray[indexPath.item]
        cell.configure(for: option)
        cell.setNeedsUpdateConstraints()
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        cell.layer.borderColor = UIColor(red: 25.0/255, green: 178.0/255, blue: 107.0/255, alpha: 1.0).cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want || padding IMAGE padding IMAGE padding ||
            let length = (collectionView.frame.width - padding * 3) / 2.0
            let height = ((collectionView.frame.height - heighpadding * 3) / 2.0) - 100.0
            return CGSize(width: length, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if optionsArray[indexPath.item] == OptionsCollectionViewCell.Options.threemonths {
            let modalViewController = ThreeMonthModal()
            present(modalViewController, animated: true, completion: nil)
        }
        else if optionsArray[indexPath.item] == OptionsCollectionViewCell.Options.sixmonths {
            let modalViewController = SixMonthModal()
            present(modalViewController, animated: true, completion: nil)
        }
        else if optionsArray[indexPath.item] == OptionsCollectionViewCell.Options.year {
            let modalViewController = YearModal()
            present(modalViewController, animated: true, completion: nil)
        }
        else {
            let modalViewController = RandomModal()
            present(modalViewController, animated: true, completion: nil)
        }
        
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
