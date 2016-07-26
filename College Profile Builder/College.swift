//
//  College.swift
//  College Profile Builder
//
//  Created by Stanley Stout on 7/25/16.
//  Copyright © 2016 Chris Stout. All rights reserved.
//

import UIKit

class College: NSObject {
    var name = ""
    var location = ""
    var enrollment = 0
    var image = UIImage(named: "Default")
    
    convenience init(name: String, location: String, enrollment: Int, image: UIImage) {
        self.init()
        self.name = name
        self.location = location
        self.enrollment = enrollment
        self.image = image
    }
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
