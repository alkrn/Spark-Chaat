import Foundation
struct TimelineItem: Codable {
    enum Gender: String, Codable {
        case male = "MALE"
        case female = "FEMALE"
    }
    
    struct Image: Codable {
        let cropped: String
        let full: String
    }

    var userId: String
    var age: Int
    var gender: Gender
    var displayName: String
    var winked: Bool
    var images: [Image]
}

extension TimelineItem {
    static func decode(fromArray data: Data?) -> [TimelineItem] {
        guard let data = data else {
            return []
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
               
        do {
            let timeline = try decoder.decode([TimelineItem].self, from: data)
            return timeline
        } catch {
            print("Failed to decode JSON \(error)")
            
            preconditionFailure(error.localizedDescription)
        }
    }
}
