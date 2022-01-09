import Foundation

struct EnterpriseModel: Codable {
    let enterprises: [Enterprise]
}

struct Enterprise: Codable {
    let id: Int
    let name, photo, description: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "enterprise_name"
        case photo
        case description = "description"
    }
    
    init(id: Int, name: String, photo: String, description: String) {
       self.id = id
       self.name = name
       self.photo = photo
       self.description = description
   }
    
    init() {
        self.id = 0
        self.name = ""
        self.photo = ""
        self.description = ""
    }
    
    init(photo: String) {
        self.id = 0
        self.name = ""
        self.photo = photo
        self.description = ""
    }
    
}
