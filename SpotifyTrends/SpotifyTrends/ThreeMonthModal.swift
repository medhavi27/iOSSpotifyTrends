//
//  ThreeMonthModal.swift
//  SpotifyTrends
//
//  Created by Michael Zhang on 11/29/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit

class ThreeMonthModal: UIViewController {

    var homeButton: UIButton!
    var titleLabel: UILabel!
    let spotifyGreen = UIColor(red: 26.0/255, green: 164.0/255, blue: 80.0/255, alpha: 1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
        homeButton = UIButton()
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.setTitle("Home", for: .normal)
        homeButton.backgroundColor = spotifyGreen
        homeButton.setTitleColor(.white, for: .normal)
        homeButton.addTarget(self, action: #selector(home), for: .touchUpInside)
        homeButton.layer.cornerRadius = 5
        view.addSubview(homeButton)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text =  "Your Last 3 Months"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.textColor = spotifyGreen
        view.addSubview(titleLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            homeButton.bottomAnchor.constraint(equalTo: homeButton.topAnchor, constant: 30)
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: homeButton.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 40)
            ])
        
    }
    
    @objc func home() {
        dismiss(animated: true, completion: nil)
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
