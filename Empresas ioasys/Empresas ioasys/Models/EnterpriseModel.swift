import Foundation

struct EnterpriseModel: Codable {
    let enterprises: [Enterprise]
}

struct SingleEnterpriseModel: Codable {
    let enterprise: Enterprise
}

struct Enterprise: Codable {
    let id: Int
    let name, photo, description: String
    let type: EnterpriseType
    

    enum CodingKeys: String, CodingKey {
        case id
        case name = "enterprise_name"
        case photo
        case description = "description"
        case type = "enterprise_type"
    }
    
    init(id: Int, name: String, photo: String, description: String, type: EnterpriseType) {
       self.id = id
       self.name = name
       self.photo = photo
       self.description = description
       self.type = type
   }
    
    init() {
        self.id = 0
        self.name = ""
        self.photo = ""
        self.description = ""
        self.type = EnterpriseType(id: 0, type: "")
    }
    
    init(photo: String) {
        self.id = 0
        self.name = ""
        self.photo = photo
        self.description = ""
        self.type = EnterpriseType(id: 0, type: "")
    }
}

struct EnterpriseType: Codable {
    var id: Int
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case type = "enterprise_type_name"
    }
}
