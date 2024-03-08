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

  let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()


    var body: some View {
      ZStack {
        VStack {
            Text("Time in Minutes")
              .font(.title)
          

              Image("Pomo")
              .resizable()
              .frame(width:200, height: 200)


          Text("Time: \(abs(sliderValue), specifier: "%.0f")")
              .font(.largeTitle)
              .foregroundStyle(.white)
              .padding(.horizontal, 20)
              .padding(.vertical, 5)
              .background(.black.opacity(0.75))
              .clipShape(.capsule)

        }
        .onReceive(timer) { time in
            guard isActive else { return }

            if sliderValue > 0 {
              sliderValue -= 1
            }
          if sliderValue == 0 {
            //AudioServicesPlaySystemSound(1026)
          }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
        .onAppear{UIApplication.shared.isIdleTimerDisabled = true
        }
        .onDisappear {
          UIApplication.shared.isIdleTimerDisabled = false
        }
      }
        }
    }



#Preview {
  ContentView(sliderValue: .constant(0.5))
}
