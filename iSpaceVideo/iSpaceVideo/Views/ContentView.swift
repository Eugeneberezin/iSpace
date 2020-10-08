//
//  ContentView.swift
//  iSpaceVideo
//
//  Created by Eugene Berezin on 10/7/20.
//

import SwiftUI
import CoreData
import SDWebImageSwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.href, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    let url = "https://images-assets.nasa.gov/video/NHQ_2018_0508_Administrator Bridenstine - We Are Going the Moon/NHQ_2018_0508_Administrator Bridenstine - We Are Going the Moon~thumb.jpg".replacingOccurrences(of: " ", with: "%20")
    @State var searchTerm = ""
    
    var body: some View {
        NavigationView{
            VStack {
                SearchBar(text: $searchTerm)
                Text(searchTerm)
                
                ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 300, maximum: 500), spacing: 0)]) {
                        ForEach(0...30, id: \.self) { num in
                            VideoItemView(image:
                                            WebImage(url: URL(string: url), options: .delayPlaceholder)
                                            
                                            .placeholder {
                                                Image("placeholder")
                                                    .resizable()
                                                    .scaledToFit()
                                                
                                            }
                                          
                            )
                            
                            
                        }
                        
                    }
                    .onAppear(perform: {
                        print("$searchTerm")
                    })
                }
                
                .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    hideKeyboard()
                })
            }
            .navigationTitle("NASA Videos")
            .background(
                Image("nightSky")
                    .resizable()
                    .scaledToFill()
                    .onTapGesture {
                        hideKeyboard()
                    }
            )
            
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.href = ""
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
