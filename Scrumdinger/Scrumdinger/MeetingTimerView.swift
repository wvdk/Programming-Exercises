import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers)
    }
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.origin.x + rect.size.width / 2.0,
                             y: rect.origin.y + rect.size.height / 2.0)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        }
    }
}

struct MeetingTimerView: View {
    @Binding var speakers: [ScrumTimer.Speaker]
    var scrumColor: Color
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            VStack {
                Text(currentSpeaker)
                    .font(.title)
                Text("is speaking")
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(scrumColor.accessibleFontColor)
            ForEach(speakers) { speaker in
                if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                    SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                        .rotation(Angle(degrees: -90))
                        .stroke(scrumColor, lineWidth: 12)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    @State static var speakers = [ScrumTimer.Speaker(name: "Wes", isCompleted: false), ScrumTimer.Speaker(name: "Kristina", isCompleted: false)]
    static var previews: some View {
        MeetingTimerView(speakers: $speakers, scrumColor: Color("Design"))
    }
}
