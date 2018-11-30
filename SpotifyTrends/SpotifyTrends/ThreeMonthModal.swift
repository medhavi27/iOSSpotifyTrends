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
    var profilePic: UIImageView!
    var artistLabel: UILabel!
    var artistPic: UIImageView!
    var otherArtists: UILabel!
    var songLabel: UILabel!
    var songPic: UIImageView!
    var otherSongs: UILabel!
    
    let spotifyGreen = UIColor(red: 26.0/255, green: 164.0/255, blue: 80.0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        let dummyPic = getImageFromURLString(urlString: "https://timedotcom.files.wordpress.com/2018/09/bill-gates-africa.jpg")
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
        
        profilePic = UIImageView()
        profilePic.translatesAutoresizingMaskIntoConstraints = false
        profilePic.contentMode = .scaleAspectFit
        profilePic.layer.masksToBounds = false
        profilePic.layer.cornerRadius =  5
        profilePic.image = dummyPic
        view.addSubview(profilePic)
        
        artistLabel = UILabel()
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        artistLabel.text =  "Your Top Artist: "
        artistLabel.textAlignment = .center
        artistLabel.font = .systemFont(ofSize:23, weight: .bold)
        artistLabel.textColor = spotifyGreen
        view.addSubview(artistLabel)
        
        artistPic = UIImageView()
        artistPic.translatesAutoresizingMaskIntoConstraints = false
        artistPic.contentMode = .scaleAspectFit
        artistPic.layer.masksToBounds = false
        artistPic.layer.cornerRadius =  5
        artistPic.image = dummyPic
        view.addSubview(artistPic)
        
        otherArtists = UILabel()
        otherArtists.translatesAutoresizingMaskIntoConstraints = false
        otherArtists.text =  "Top 5 Artists: Bill Gates, Imagine Dragons, Zedd, Steve Jobs, The 1975"
        otherArtists.textAlignment = .center
        otherArtists.numberOfLines = 0
        otherArtists.font = .systemFont(ofSize: 14, weight: .bold)
        otherArtists.textColor = spotifyGreen
        view.addSubview(otherArtists)
        
        songLabel = UILabel()
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.text =  "Your Top Song: "
        songLabel.textAlignment = .center
        songLabel.font = .systemFont(ofSize:23, weight: .bold)
        songLabel.textColor = spotifyGreen
        view.addSubview(songLabel)
        
        songPic = UIImageView()
        songPic.translatesAutoresizingMaskIntoConstraints = false
        songPic.contentMode = .scaleAspectFit
        songPic.layer.masksToBounds = false
        songPic.layer.cornerRadius =  5
        songPic.image = dummyPic
        view.addSubview(songPic)
        
        otherSongs = UILabel()
        otherSongs.translatesAutoresizingMaskIntoConstraints = false
        otherSongs.text =  "Top 5 Songs: Bill Gates, Imagine Dragons, Zedd, Steve Jobs, The 1975, asdgasgassdgsadgasdfasdsdfadasfd"
        otherSongs.textAlignment = .center
        otherSongs.numberOfLines = 0
        otherSongs.font = .systemFont(ofSize: 14, weight: .bold)
        otherSongs.textColor = spotifyGreen
        view.addSubview(otherSongs)
        
        
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
        
        NSLayoutConstraint.activate([
            profilePic.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            profilePic.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profilePic.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profilePic.bottomAnchor.constraint(equalTo: profilePic.topAnchor, constant: 100)
            ])
        
        NSLayoutConstraint.activate([
            artistLabel.topAnchor.constraint(equalTo: profilePic.bottomAnchor, constant: 40),
            artistLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            artistLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            artistLabel.bottomAnchor.constraint(equalTo: artistLabel.topAnchor, constant: 60)
            ])
        
        NSLayoutConstraint.activate([
            artistPic.topAnchor.constraint(equalTo: artistLabel.topAnchor),
            artistPic.leadingAnchor.constraint(equalTo: artistLabel.trailingAnchor),
            artistPic.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            artistPic.bottomAnchor.constraint(equalTo: artistLabel.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            otherArtists.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: 30),
            otherArtists.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            otherArtists.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            otherArtists.bottomAnchor.constraint(equalTo: otherArtists.topAnchor, constant: 60)
            ])
        
        NSLayoutConstraint.activate([
            songLabel.topAnchor.constraint(equalTo: otherArtists.bottomAnchor, constant: 50),
            songLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            songLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            songLabel.bottomAnchor.constraint(equalTo: songLabel.topAnchor, constant: 60)
            ])
        
        NSLayoutConstraint.activate([
            songPic.topAnchor.constraint(equalTo: songLabel.topAnchor),
            songPic.leadingAnchor.constraint(equalTo: songLabel.trailingAnchor),
            songPic.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            songPic.bottomAnchor.constraint(equalTo: songLabel.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            otherSongs.topAnchor.constraint(equalTo: songLabel.bottomAnchor, constant: 30),
            otherSongs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            otherSongs.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            otherSongs.bottomAnchor.constraint(equalTo: otherSongs.topAnchor, constant: 100)
            ])
    }
    
    
    @objc func home() {
        dismiss(animated: true, completion: nil)
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
