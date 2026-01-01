//
//  WishListApp.swift
//  WishList
//
//  Created by sepideh aph on 2026-01-01.
//

import SwiftUI
import SwiftData

@main
struct WishListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
