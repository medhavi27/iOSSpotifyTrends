//
//  DisplayView.swift
//  SpotifyTrends
//
//  Created by Michael Zhang on 11/29/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit

class DisplayView: UIViewController {
    
    var profilePic: UIImageView!
    var artistLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilePic = UIImageView()
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.contentMode = .scaleAspectFit
        profilePic.layer.masksToBounds = false
        profilePic.layer.cornerRadius =  5
        profilePic.image = getImageFromURLString(urlString: "https://timedotcom.files.wordpress.com/2018/09/bill-gates-africa.jpg")
        view.addSubview(profilePic)
        // Do any additional setup after loading the view.
    }
    

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            profilePic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profilePic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profilePic.bottomAnchor.constraint(equalTo: profilePic.topAnchor, constant: 100)
            ])
    }
    
    func getImageFromURLString(urlString: String) -> UIImage? {
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
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
