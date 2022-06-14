import Foundation

// MARK: - WSBAPIElement
struct WSBAPIElement: Codable {
    let noOfComments: Int
    let sentiment: String
    let sentimentScore: Double
    let ticker: String

    enum CodingKeys: String, CodingKey {
        case noOfComments = "no_of_comments"
        case sentiment = "sentiment"
        case sentimentScore = "sentiment_score"
        case ticker = "ticker"
    }
}

typealias Wsbapi = [WSBAPIElement]
