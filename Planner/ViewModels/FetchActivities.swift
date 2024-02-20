//
//  FetchActivities.swift
//  Planner
//
//  Created by Tom Work on 14/02/2024.
//

import Foundation


struct ActivityParentDestination: Codable {
    let id: String
    let name: String
    let entityType: String
    let timezone: String
    let children: [ActivityChildDestination]
}

struct ActivityChildDestination: Codable {
    let id: String
    let name: String
    let slug: String?
    let entityType: String
    let externalId: String
    let parentId: String
    let location: ActivityLocation
}

struct ActivityLocation: Codable {
    let latitude: Double?
    let longitude: Double?
}


func LoadActivityData(locationId: String) async -> [ActivityParentDestination]? {
    guard let url = URL(string: "https://api.themeparks.wiki/v1/entity/\(locationId)/children") else {
        print("Invalid URL")
        return nil
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)

        if let decodedResponse = try? JSONDecoder().decode(ActivityParentDestination.self, from: data) {
            print("Worked")
            print(url.absoluteString)
            return [decodedResponse]
            
        }
    } catch {
        print("Invalid data")
    }
    print(url.absoluteString)
    return nil
}
