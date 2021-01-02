//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Wesley Van der Klomp on 1/2/21.
//

import SwiftUI

struct MeetingTimerView: View {
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text("Someone is speaking")
        }
        .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingTimerView()
    }
}
