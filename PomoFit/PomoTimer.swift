//
//  Timer.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 3/11/24.
//

import SwiftUI
import AVFoundation

struct PomoTimer: View {
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true

  @State private var timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

  @Binding var sliderValue: Double
  @Binding  var counter : Int
  @Binding  var counterDisplayed : Int


    var body: some View {

      VStack {
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

        print("Slider value is \(sliderValue)")

        print("pre \(sliderValue)")

        if (sliderValue - 1) < 1 {
          sliderValue -= 1
          self.timer.upstream.connect().cancel()
          print("I stopped")
          } else {
              sliderValue -= 1
              print("post \(sliderValue)")
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

#Preview {
  PomoTimer(sliderValue: .constant(5.0),counter: .constant(5),counterDisplayed: .constant(5))
}
