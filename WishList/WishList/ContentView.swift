//
//  ContentView.swift
//  WishList
//
//  Created by sepideh aph on 2026-01-01.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [Wish]
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { item in
                    Text(item.title)
                }
            }
            .navigationTitle("wishLsit")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My WishList", systemImage: "heart.circle", description: Text("No wishes yet. Add one too get started"))
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
