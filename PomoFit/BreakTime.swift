//
//  BreakTime.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 3/11/24.
//

import SwiftUI

struct BreakTime: View {

  @Binding var selectedBreak: Int

    var body: some View {

      Text("Selected Break in Minutes")
        .font(.title)
      
        Text("Time: \(abs(selectedBreak))")
        .font(.largeTitle)
        .foregroundStyle(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .background(.black.opacity(0.75))
        .clipShape(.capsule)
    }
}

#Preview {
  BreakTime(selectedBreak: .constant(5))
}
