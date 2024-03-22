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
  @State private var sliderValueBreak: Double = 15.0

  @State private var counter = 0

  @State private var counterDisplayed = 0


  @State private var isEnabled = true



  var body: some View {
    NavigationView {
      VStack {

        NavigationLink(destination: ContentView(sliderValue: $sliderValue,sliderValueBreak: $sliderValueBreak,counter: $counter,counterDisplayed:$counterDisplayed,isEnabled:$isEnabled))
        {
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
          Slider(value: $sliderValueBreak, in: 0...15)
            .padding(.horizontal)

          Divider()
          Text("Break Time  : \(abs(sliderValueBreak), specifier: "%.0f")")
            .font(.title2)

          Divider()
          Toggle(isOn: $isEnabled) {
              Text("Disable Break")
              .font(.system(.title2, design: .rounded))


          }.opacity(0)


        }


      }.navigationTitle("Set Up Your PomoFit")

    }


  }
}

#Preview {
  ManagementView()
}
