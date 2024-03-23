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
    @State private var isHidden = true

  @State private var timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

  @Binding var sliderValue: Double
  @Binding  var counter : Int
  @Binding  var counterDisplayed : Int
  @Binding var isEnabled: Bool


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
        print("value of pre isEnabled is \(isEnabled)")

        print("pre \(sliderValue)")

        if (sliderValue) < 1 {
          //sliderValue -= 1
          self.timer.upstream.connect().cancel()
          print("I stopped setting timer to visible")
          //isEnabled = false



          } else {
              sliderValue -= 1
              print("post \(sliderValue)")
            if (sliderValue <= 1 && sliderValue >= 0)
            {
              isEnabled = false

              print("value of post isEnabled is \(isEnabled)")
            }
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
  PomoTimer(sliderValue: .constant(5.0),counter: .constant(5),counterDisplayed: .constant(5),isEnabled: .constant(false))
}
