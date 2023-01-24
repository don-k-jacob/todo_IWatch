//
//  ContentView.swift
//  WatchTaskList Watch App
//
//  Created by don kora jacob on 24/01/23.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
//        TabView{
//            NavigationStack{
//                ItemList()
//            }
//
//            NavigationStack{
//                ProductivityChart()
//            }
//        }
        ItemList()
    }
}

struct ProductivityChart: View{
    var body:some View{
        Image(systemName: "chart.bar.fill")
            .navigationTitle("Productivity")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

        
struct ItemList: View {
    @EnvironmentObject private var model : ItemListModel
    @State private var showDetails = false
    var body: some View{
        
        List($model.items){
            $item in Button {
                showDetails = true
            } label: {
                Label(item.description,systemImage: "pencil")
            }.sheet(isPresented: $showDetails)
            {
                ItemDetail(item: $item)
            }
            
        }.toolbar{
            AddItemLink()
        }
        .navigationTitle("Tasks")
    }
}


