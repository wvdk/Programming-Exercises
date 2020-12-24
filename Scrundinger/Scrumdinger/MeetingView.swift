//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Wesley Van der Klomp on 12/24/20.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        ProgressView(value: 5, total: 15)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
