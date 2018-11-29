//
//  ViewController.swift
//  SpotifyTrends
//
//  Created by Michael Zhang on 11/23/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var loginbutton: UIButton!
    var logoimg: UIImageView!
    var welcomeview: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .black
        title = "Spotify Trends - Login"
       
        loginbutton = UIButton()
        loginbutton.translatesAutoresizingMaskIntoConstraints = false
        loginbutton.backgroundColor = UIColor(red: 26.0/255, green: 164.0/255, blue: 80.0/255, alpha: 1.0)
        loginbutton.setTitleColor(.black, for: .normal)
        loginbutton.setTitle("Login", for: .normal)
        loginbutton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        
        welcomeview = UITextView()
        welcomeview.translatesAutoresizingMaskIntoConstraints = false
        welcomeview.textColor = UIColor(red: 26.0/255, green: 164.0/255, blue: 80.0/255, alpha: 1.0)
        welcomeview.text = "Welcome to Spotify Trends. To get Started, login with your Spotify account:"
        welcomeview.font = UIFont(name: (welcomeview.font?.fontName)!, size: 30)
        welcomeview.backgroundColor = .black
        welcomeview.isEditable = false
        
        let imagel = UIImage(named: "exp")
        logoimg = UIImageView(image: imagel)
        logoimg.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginbutton)
        view.addSubview(logoimg)
        view.addSubview(welcomeview)
        
        setupConstraints()
    }
    @objc func setupConstraints() {
       
        NSLayoutConstraint.activate ([
            loginbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 450),
           loginbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
           loginbutton.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate ([
            welcomeview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            welcomeview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            welcomeview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            welcomeview.heightAnchor.constraint(equalToConstant: 200)
            ])
        NSLayoutConstraint.activate ([
            logoimg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoimg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logoimg.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 60),
            logoimg.heightAnchor.constraint(equalToConstant: 600)
            ])
        
        
        
        
        
    }
    @objc func pushNavViewController() {
        let navViewController = HomeNavViewController()
        //navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }



}

