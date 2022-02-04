//
//  API.swift
//  Zamboni
//
//  Created by Jamon Holmgren on 2/3/22.
//

import Foundation


struct Person: Codable {
    var name: String
    var title: String
    var image: String
}

struct TeamData: Codable {
    var company: String
    var yearFounded: String
    var website: String
    var description: String
    var team: Array<Person>
}


let API_URL: String = "https://raw.githubusercontent.com/jamonholmgren/Zamboni/main/Zamboni/data.json"

class API {
    func persons(url: String) async -> Array<Person> {
        guard let url = URL(string: url) else { preconditionFailure("Invalid URL: \(url)") }
        
        let (data, _) = try! await URLSession.shared.data(from: url)

        return try! JSONDecoder().decode(TeamData.self, from: data).team
    }
}
