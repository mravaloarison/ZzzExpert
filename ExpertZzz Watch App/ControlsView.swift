//
//  ControlsView.swift
//  ExpertZzz Watch App
//
//  Created by Mami Ravaloarison on 11/16/24.
//

import SwiftUI

struct ControlsView: View {
    @StateObject var ourActionManager = OurActionManager()

    var body: some View {
        HStack {
            VStack {
                Button {
                    ourActionManager.ended = true
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(Color.red)
                .font(.title2)
                Text("End")
            }
            VStack {
                Button {
                    ourActionManager.togglePause()
                } label: {
                    Image(systemName: ourActionManager.isPauseActive ? "pause" : "play")
                }
                .tint(ourActionManager.isPauseActive ? Color.yellow : Color.brown)
                .font(.title2)
                Text(ourActionManager.isPauseActive ? "Pause" : "Resume")
            }
        }
        .fullScreenCover(isPresented: $ourActionManager.ended, content: {
            SummaryView()
        })
        .onChange(of: ourActionManager.ended) {
            if ourActionManager.ended {
                print("Session has ended")
            }
        }
    }
}

#Preview {
    ControlsView()
}
