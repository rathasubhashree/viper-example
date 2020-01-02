import Foundation

struct ApplicationResult: Decodable {

    let applicationName: String
    let appImage: String
    let appURL: String
    let artistName: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case appImage = "artworkUrl100"
        case appURL = "url"
        case artistName = "artistName"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        applicationName = try container.decode(String.self, forKey: .name)
        appImage = try container.decode(String.self, forKey: .appImage)
        appURL = try container.decode(String.self, forKey: .appURL)
        artistName = try container.decode(String.self, forKey: .artistName)
    }
}
