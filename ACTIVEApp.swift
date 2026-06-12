//
//  ACTIVEApp.swift
//  ACTIVE
//
//  Created by Emma Bian on 2025-10-29.
//

import SwiftUI

@main
struct ACTIVEApp: App {
    
    @StateObject var exerciseData = ExerciseData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(exerciseData)
//                .environmentObject(ExerciseData())
        }
    }
}
