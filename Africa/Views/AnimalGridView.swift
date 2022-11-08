//
//  AnimalGridView.swift
//  Africa
//
//  Created by Ashish Dutt on 06/11/22.
//

import SwiftUI

struct AnimalGridView: View {
    // MARK: - Variables
    
    let animal: Animal
    
    // MARK: - Body
    var body: some View {
        
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
            
        
    }//Body
}

struct AnimalGridView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
