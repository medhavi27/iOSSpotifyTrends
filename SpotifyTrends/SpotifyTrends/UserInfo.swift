//
//  UserInfo.swift
//  SpotifyTrends
//
//  Created by Medhavi Gandhi on 11/30/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import Foundation
import Alamofire

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
    
    static func getArtists(timespan: String, _ didGetArtists: @escaping ([Artist]) -> Void) {
        Alamofire.request(endpoint, method: .get, parameters: ["type": "artists", "limit": 5, "time_range": timespan]).validate().responseData { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case.success(let data):
                let jsonDecoder = JSONDecoder()
                if let artistResponse = try? jsonDecoder.decode(ArtistResponse.self, from: data) {
                    didGetArtists(artistResponse.items)
                }
            }
        }
        
    }
    
    static func getTracks(timespan: String, _ didGetTracks: @escaping ([Track]) -> Void) {
        Alamofire.request(endpoint, method: .get, parameters: ["type": "tracks", "limit": 5, "time_range": timespan]).validate().responseData { (response) in
            switch response.result {
            case .failure(let error):
                print(error.localizedDescription)
            case.success(let data):
                let jsonDecoder = JSONDecoder()
                if let trackResponse = try? jsonDecoder.decode(TrackResponse.self, from: data) {
                    didGetTracks(trackResponse.items)
                }
            }
        }
        
    }
}
