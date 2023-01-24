//
//  ContentView.swift
//  WatchTaskList Watch App
//
//  Created by don kora jacob on 24/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var model : ItemListModel
    var body: some View {
        List($model .items){
            $item in Text(item.description)
        }.toolbar{
            AddItemLink()
        }
        .navigationTitle("Tasks")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

        struct AddItemLink: View{
            @EnvironmentObject private var model:ItemListModel
            var body:some View{
                
                    TextFieldLink(prompt: Text("New Item")){
                        Label("Add",systemImage: "plus.circle.fill")
                    }  onSubmit: {
                        model.items.append(ListItem(description: $0))
                        
                    }.buttonStyle(.borderedProminent)
                    
                }
            
        }
