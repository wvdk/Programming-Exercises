//
//  ContentView.swift
//  Landmarks
//
//  Created by Wesley Van der Klomp on 6/3/19.
//  Copyright © 2019 wes. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            CircleImage()
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
