//
//  UserInfo.swift
//  SpotifyTrends
//
//  Created by Medhavi Gandhi on 11/30/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import Foundation
import Alamofire
import SpotifyLogin

struct ArtistResponse: Codable {
    var items: [Artist]
}

struct TrackResponse: Codable {
    var items: [Track]
}

struct Artist: Codable {
    let name: String
    let genres: [String]
    let popularity: Int
    let images: [Image]
}

struct Track: Codable {
    let name: String
    let popularity: Int
    let duration_ms: Int
    let album: Album
}

struct Album: Codable {
    let name: String
    let images: [Image]
}

struct Image: Codable {
    let url: String
}

class NetworkManager {
    
    private static let endpoint = ""
    
    static func getImageFromURLString(urlString: String) -> UIImage? {
        if let url = URL(string: urlString), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }
    
    static func getArtists(timespan: String, _ didGetArtists: @escaping ([Artist]) -> Void) {
        SpotifyLogin.shared.getAccessToken { (accessToken, error) in
            if error == nil {
                Alamofire.request("https://api.spotify.com/v1/me/top/artists?limit=5", method: .get, parameters: nil, encoding: URLEncoding.queryString, headers: ["Authorization": "Bearer" + accessToken!]).validate().responseData { (response) in
                    switch response.result {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case.success(let data):
                        print(data)
                        let jsonDecoder = JSONDecoder()
                        if let artistResponse = try? jsonDecoder.decode(ArtistResponse.self, from: data) {
                            didGetArtists(artistResponse.items)
                        }
                    }
                }
            }
        }
        

    }
//
//    static func getTracks(timespan: String, _ didGetTracks: @escaping ([Track]) -> Void) {
//        Alamofire.request(endpoint, method: .get, parameters: ["type": "tracks", "limit": 5, "time_range": timespan]).validate().responseData { (response) in
//            switch response.result {
//            case .failure(let error):
//                print(error.localizedDescription)
//            case.success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let trackResponse = try? jsonDecoder.decode(TrackResponse.self, from: data) {
//                    didGetTracks(trackResponse.items)
//                }
//            }
//        }
//
//    }
}
