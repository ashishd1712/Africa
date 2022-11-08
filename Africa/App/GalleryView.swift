//
//  GalleryView.swift
//  Africa
//
//  Created by Ashish Dutt on 29/08/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - Properties
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //Simple Grid Definition
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // Efficient Grid layout
    
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    //Dynamic Grid layout
    
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count:3)
    @State private var gridColumns: Double = 3.0 
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - VStack
            VStack(alignment: .center ,spacing: 30) {
                // MARK: - Image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 8))
                // MARK: - Slider
                
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns, perform: {value in
                        gridSwitch()
                    })
                
                // MARK: - Grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }//Loop
                }//Grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }//Vstack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
