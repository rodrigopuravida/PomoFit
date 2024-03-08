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

  @EnvironmentObject var settings: TimeSettings

  @State private var isSecondViewActive = false

  @State private var sliderValue: Double = 60.0


  var body: some View {
    NavigationView {
      VStack {

        NavigationLink(destination: ContentView(sliderValue: $sliderValue)) {
          Text("Go PomoFit")
            .font(.title)
        }
        .padding()
        Text("Time in Minutes")
          .font(.title)
        Slider(value: $sliderValue, in: 0...60)
          .padding(.horizontal)

        Divider()
        Text("Time  : \(sliderValue, specifier: "%.0f")")
          .font(.title2)

        // Pass the slider value to the SecondView
        //ContentView(sliderValue: $sliderValue)

      }.navigationTitle("Set Up Your PomoFit")

    }


  }
}

#Preview {
  ManagementView()
}
