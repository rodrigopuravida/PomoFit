//
//  ContentView.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 2/29/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {

  @Environment(\.scenePhase) var scenePhase
  @State private var isActive = true

  @Binding var sliderValue: Double
  @Binding var sliderValueBreak: Double
  @Binding var counter: Int
  @Binding var counterDisplayed: Int


  let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()


  var body: some View {
    ZStack {
      VStack {
        Text("Time in Minutes")
          .font(.title)


        Image("Pomo")
          .resizable()
          .frame(width:200, height: 200)


        PomoTimer(sliderValue: $sliderValue,
                  counter: $counter ,counterDisplayed:$counterDisplayed)
 


        BreakTime(sliderValue: $sliderValue, sliderValueBreak: $sliderValueBreak)



      }


    }
  }
}



#Preview {
  ContentView(sliderValue: .constant(0.5), sliderValueBreak: .constant(3.0),counter: .constant(3),counterDisplayed: .constant(5))
}
