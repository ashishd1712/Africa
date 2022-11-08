//
//  CenterModifier.swift
//  Africa
//
//  Created by Ashish Dutt on 06/11/22.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}

