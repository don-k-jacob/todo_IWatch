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
struct ItemDetail: View{
    @Binding var item: ListItem
    
    var body: some View {
        Form {
            Section(header: Text("Task  Info")){
                TextField("Item",text: $item.description,prompt: Text("List Item"))
                
                Stepper(value: $item.estimatedWork,
                        in: (0...14)
                )
                {
                    Text("\(item.estimatedWork)  days").font(.system(.footnote,weight: .bold))
                }
                Toggle(isOn: $item.isComplete)
                {
                    Text("Completed")
                }
//                ShareLink(items: [$item.description], subject: Text("Please help"), message: Text("(I need some help figuring out this.)")).buttonStyle(.borderedProminent)
//                    .buttonBorderShape(.roundedRectangle)
                
            }
            
            
            
            
        }
    }
}
