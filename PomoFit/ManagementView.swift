//
//  ManagementView.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 3/5/24.
//

import SwiftUI

class TimeSettings: ObservableObject {
  @Published var startTime = 0.0
}

struct ManagementView: View {

  @State private var isSecondViewActive = false

  @State private var sliderValue: Double = 60.0

  var breakTimes = [3, 5, 10, 15]
  @State private var selectedBreak = 5


  var body: some View {
    NavigationView {
      VStack {

        NavigationLink(destination: ContentView(sliderValue: $sliderValue, selectedBreak: $selectedBreak)) {
          Text("Go PomoFit")
            .font(.title)
        }
        .padding()
        Text("Time in Minutes")
          .font(.title)
        Slider(value: $sliderValue, in: 0...60)
          .padding(.horizontal)

        Divider()
        Text("Time  : \(abs(sliderValue), specifier: "%.0f")")
          .font(.title2)
        Divider()

        VStack {
          Text("Please choose a Break Time")
            .font(.title2)

        .padding([.top, .leading, .bottom], 10.0)
        Picker("Please choose a Break Time", selection: $selectedBreak) {
                        ForEach(breakTimes, id: \.self) {
                            Text(String($0))
                        }
                    }
                    Text("You selected: \(selectedBreak) minutes break")
        }


      }.navigationTitle("Set Up Your PomoFit")

    }


  }
}

#Preview {
  ManagementView()
}
