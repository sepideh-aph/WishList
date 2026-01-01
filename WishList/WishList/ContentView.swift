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
    @State var isAlertShowing:Bool = false
    @State var newWish:String = ""

    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical,2)
                        .swipeActions {
                            Button("delete", role: .destructive) {
                                modelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("wishLsit")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        self.isAlertShowing.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    })
                }
                
                if !wishes.isEmpty {
                    ToolbarItem(placement: .bottomBar) {
                        if wishes.count >= 1 {
                            Text("\(wishes.count) wish\(wishes.count>1 ? "es" : "")")
                        }
                    }
                }
            }
            .alert("create a new wish", isPresented: $isAlertShowing){
                TextField("enter a new wish", text: $newWish)
                
                Button(action: {
                    modelContext.insert(Wish(title: newWish))
                    newWish = ""
                }, label: {
                    Text("save")
                })
            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My WishList", systemImage: "heart.circle", description: Text("No wishes yet. Add one too get started"))
                }
            }
        }
    }
}

//#Preview("list with sample data") {
//    let container = try! ModelContainer(for: Wish.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
//    container.mainContext.insert(Wish(title: "wish 1"))
//    container.mainContext.insert(Wish(title: "wish 2"))
//    container.mainContext.insert(Wish(title: "wish 3"))
//
//    ContentView()
//        .modelContainer(container)
//}


#Preview("empty list") {
    ContentView()
        .modelContainer(for: Wish.self, inMemory: true)
}
