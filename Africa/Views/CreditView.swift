//
//  CreditView.swift
//  Africa
//
//  Created by Ashish Dutt on 06/11/22.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128,height: 128, alignment: .center)
            Text("""
    Copyright © Ashish Dutt
    All rights reserved
    🔥
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
