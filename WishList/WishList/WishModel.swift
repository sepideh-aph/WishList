//
//  WishModel.swift
//  WishList
//
//  Created by sepideh aph on 2026-01-01.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
