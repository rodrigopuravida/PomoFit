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
    NavigationView{
      ZStack {
        Image("focus")
          .resizable()
          //.aspectRatio(contentMode: .fill)
          .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)


        VStack {
          NavigationLink(destination: ContentView(sliderValue: $sliderValue,sliderValueBreak: $sliderValueBreak,counter: $counter,counterDisplayed:$counterDisplayed,isEnabled:$isEnabled))
          {
            Text("Go PomoFit")
              .font(.title)
              .foregroundColor(.black)
          }
          .navigationTitle("Set Up Your PomoFit")
          .foregroundColor(.white)

          .padding()
          Text("Time in Minutes")
            .font(.title)
            .foregroundColor(.white)
          Slider(value: $sliderValue, in: 0...60)
            .padding(.horizontal)

          Divider()
          Text("Time  : \(abs(sliderValue), specifier: "%.0f")")
            .font(.title2)
            .foregroundColor(.white)
          Divider()

          Text("Please choose a Break Time")
            .font(.title2)
            .foregroundColor(.white)

          .padding([.top, .leading, .bottom], 10.0)
          Slider(value: $sliderValueBreak, in: 0...15)
            .padding(.all)


          Divider()
          Text("Break Time  : \(abs(sliderValueBreak), specifier: "%.0f")")
            .font(.title2)
            .foregroundColor(.white)

          Divider()

          Toggle(isOn: $isEnabled) {
            Text("Disable Break")
              .font(.system(.title2, design: .rounded))
              .foregroundColor(.white)
          }.opacity(0)




        }
      }
    }

  }
}


#Preview {
  ManagementView()
}
