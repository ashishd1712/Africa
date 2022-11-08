//
//  ContentView.swift
//  Africa
//
//  Created by Ashish Dutt on 29/08/22.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    @State private var isGridViewActive: Bool = false
    
    let haptics = UIImpactFeedbackGenerator()
    
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var gridColumn: Int = 2
    @State private var toolBarIcon: String = "square.grid.3x2"
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
        
    }
    
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach (animals){animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListView(animal: animal)
                                    .listRowBackground(Color.clear)
                                
                            }.listRowBackground(Color.clear)
                        }
                        CreditView()
                            .modifier(CenterModifier())
                            .listRowBackground(Color.clear)
                    }
                    .frame(width: UIScreen.main.bounds.width + 50)
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 5){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridView(animal: animal)
                                        .padding(.vertical,2)
                                        .animation(.easeIn)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        Button(action: {
                            print("List")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }){
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        Button(action: {
                            print("grid")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }){
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
