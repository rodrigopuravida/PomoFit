//
//  ContentView.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 2/29/24.
//

import SwiftUI
import AVFoundation

struct ContentView: View {

  //@State private var focusTime: Double = .zero
  @State private var timeRemaining : Double = 10
  let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()

  @Environment(\.scenePhase) var scenePhase
  @State private var isActive = true


    var body: some View {
      ZStack {
        VStack {
            Text("Time in Minutes")
              .font(.title)
          Slider(value: $timeRemaining, in: 0...60)
            Text("\(abs(timeRemaining), specifier: "%.0f")")
              .font(.title)

              Image("Pomo")
              .resizable()
              .frame(width:200, height: 200)

          /*
            Button {
              print("Clicked the Start")
            }
              label: {
                Label("Start", systemImage: "pencil")
                  .padding()
                  .foregroundStyle(.white)
                  .background(.red)

                }
              .padding()


            Text("Time left : \(focusTime, specifier: "%.0f")")
              .font(.largeTitle)
 */

          Text("Time: \(abs(timeRemaining), specifier: "%.0f")")
              .font(.largeTitle)
              .foregroundStyle(.white)
              .padding(.horizontal, 20)
              .padding(.vertical, 5)
              .background(.black.opacity(0.75))
              .clipShape(.capsule)

        }
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
          if timeRemaining == 0 {
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
    ContentView()
}
