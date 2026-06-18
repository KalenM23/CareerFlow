//
//  Item.swift
//  JobTracker
//
//  Created by Kalen Mclaughlin on 6/18/26.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
