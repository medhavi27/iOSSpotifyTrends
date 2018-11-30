//
//  ViewController.swift
//  SpotifyTrends
//
//  Created by Michael Zhang on 11/23/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
    var loginbutton: UIButton!
    var logoimg: UIImageView!
    var welcomeview: UITextView!
    let endPoint = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .black
        title = "Spotify Trends - Login"
        //AppDelegate.spotifySession?.accessToken
       
        loginbutton = UIButton()
        loginbutton.translatesAutoresizingMaskIntoConstraints = false
        loginbutton.backgroundColor = UIColor(red: 25.0/255, green: 178.0/255, blue: 107.0/255, alpha: 1.0)
        loginbutton.setTitleColor(.black, for: .normal)
        loginbutton.setTitle("CONTINUE", for: .normal)
        loginbutton.layer.cornerRadius = 10
        loginbutton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        
        welcomeview = UITextView()
        welcomeview.translatesAutoresizingMaskIntoConstraints = false
        welcomeview.textColor = UIColor(red: 26.0/255, green: 164.0/255, blue: 80.0/255, alpha: 1.0)
        welcomeview.text = "Continue with your Spotify account:"
        welcomeview.font = UIFont(name: (welcomeview.font?.fontName)!, size: 30)
        welcomeview.backgroundColor = .black
        welcomeview.isEditable = false
        
        let imagel = UIImage(named: "spotifytr")
        logoimg = UIImageView(image: imagel)
        logoimg.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loginbutton)
        view.addSubview(logoimg)
        view.addSubview(welcomeview)
        
        setupConstraints()
        let parameters: [String:Any] = [
            "authtoken": AppDelegate.spotifySession?.accessToken
        ]
        Alamofire.request(endPoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
//                let jsonDecoder = JSONDecoder()
//                if let user = try? jsonDecoder.decode(User.self, from: data) {
//                    completion(user)
//                } else {
//                    print("Invalid Response Data")
//                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    @objc func setupConstraints() {
       
        NSLayoutConstraint.activate ([
            loginbutton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 510),
           loginbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
           loginbutton.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate ([
            welcomeview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400),
            welcomeview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            welcomeview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            welcomeview.heightAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate ([
            logoimg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoimg.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoimg.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logoimg.heightAnchor.constraint(equalToConstant: 350)
            ])
        
    }
    @objc func pushNavViewController() {
        let navViewController = HomeNavViewController()
        //navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }



}

