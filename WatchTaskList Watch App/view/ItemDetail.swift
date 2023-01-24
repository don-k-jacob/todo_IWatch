//
//  ItemDetail.swift
//  WatchTaskList Watch App
//
//  Created by don kora jacob on 24/01/23.
//

import Foundation
import SwiftUI

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
