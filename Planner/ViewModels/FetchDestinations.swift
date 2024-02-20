//
//  FetchDestinations.swift
//  Planner
//
//  Created by Tom Work on 12/02/2024.
//

import Foundation

struct TempResponse: Codable {
    var destinations: [TempDestination]
}

struct TempDestination: Codable {
    var id: String
    var name: String
    var slug: String
    var parks: [TempPark]
}

struct TempPark: Codable {
    var id: String
    var name: String
}

func LoadData() async -> [TempDestination]? {
    guard let url = URL(string: "https://api.themeparks.wiki/v1/destinations") else {
        print("Invalid URL")
        return nil
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        if let decodedResponse = try? JSONDecoder().decode(TempResponse.self, from: data) {
        return decodedResponse.destinations
        }
    } catch {
        print("Invalid data")
    }
    return nil
}



