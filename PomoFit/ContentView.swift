//
//  ContentView.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 2/29/24.
//

import SwiftUI

struct ContentView: View {

  @State private var focusTime: Double = 0

    var body: some View {
        VStack {
          Text("Time in Minutes")
          Slider(value: $focusTime, in: 0...60)
          Text("\(focusTime, specifier: "%.0f")")

            Image("Pomo")
            .resizable()
            .frame(width:200, height: 200)

          Button {
            print("Clicked the Start")
          }
            label: {
              Label("Start", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)

              }
            }
          }
    }


#Preview {
    ContentView()
}
