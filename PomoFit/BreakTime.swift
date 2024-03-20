//
//  BreakTime.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 3/11/24.
//

import SwiftUI

struct BreakTime: View {

  @Environment(\.scenePhase) var scenePhase
  @State private var isActive = true


  @Binding var sliderValue: Double
  @Binding var sliderValueBreak: Double

  @State private var timerBreak = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

  var body: some View {

    Text("Break Time")
      .font(.title)

    VStack {
      Text("Time: \(abs(sliderValueBreak), specifier: "%.0f")")
        .font(.largeTitle)
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .background(.black.opacity(0.75))
        .clipShape(.capsule)
    }
    .onReceive(timerBreak) { time in
      guard isActive else { return }

      print("Slider BREAK value is \(sliderValueBreak)")

      print("pre BREAK\(sliderValueBreak)")

      if (sliderValueBreak - 1) < 1 {
        sliderValueBreak -= 1
        self.timerBreak.upstream.connect().cancel()
        print("I stopped")
        } else {
          sliderValueBreak -= 1
            print("post BREAK \(sliderValueBreak)")
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
  BreakTime(sliderValue: .constant(5.0),sliderValueBreak: .constant(5.0))
}
