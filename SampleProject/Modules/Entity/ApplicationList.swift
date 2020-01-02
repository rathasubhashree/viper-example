import Foundation

struct ApplicationList: Decodable {

    let results: [ApplicationResult]

    enum CodingKeys: String, CodingKey {
        case feed
    }

    enum FeedKeys: String, CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let feed = try container.nestedContainer(keyedBy: FeedKeys.self, forKey: .feed)
        results = try feed.decode([ApplicationResult].self, forKey: .results)
    }
}
