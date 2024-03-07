//
//  ManagementView.swift
//  PomoFit
//
//  Created by Rodrigo Carballo on 3/5/24.
//

import SwiftUI

struct ManagementView: View {

  @State private var isSecondViewActive = false

  var body: some View {
    NavigationView {
      VStack {

        NavigationLink(destination: ContentView()) {
          Text("Go PomoFit")
        }
        
      }.navigationTitle("Set Up Your PomoFit")

    }


  }
}

#Preview {
  ManagementView()
}
