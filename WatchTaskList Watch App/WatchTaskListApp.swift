//
//  WatchTaskListApp.swift
//  WatchTaskList Watch App
//
//  Created by don kora jacob on 24/01/23.
//

import SwiftUI


// create a list item

struct ListItem : Identifiable,Hashable{
    let id = UUID()
    
    var description: String
    var estimatedWork: Int = 1
    var creationDate: Date = Date()
    var completionDate: Date?
    var isComplete: Bool = false
    
    init(description: String) {
        self.description = description
    }
}

// create a model

class ItemListModel: NSObject,ObservableObject{
    @Published var items = [ListItem]()
}

@main
struct WatchTaskListWatchAppApp: App {
    @StateObject var itemListModel = ItemListModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(itemListModel)
            }
            
        }
    }
}


