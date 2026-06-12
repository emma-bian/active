//
//  HomeScreen.swift
//  ACTIVE
//
//  Created by Emma Bian on 2025-12-09.
//

import SwiftUI

struct HomeScreen: View {
    
    @EnvironmentObject var exerciseData: ExerciseData
    
    
    var body: some View {
        ZStack {
            Color.pale.ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                
//                Text("ACTIVE")
//                    .foregroundStyle(Color.text)
//                    .font(.custom("Futura", size: 25))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal, 30)
//                    .padding(.top, 10)
//                
//                Text("home")
//                    .foregroundStyle(Color.text)
//                    .font(.custom("Futura", size: 15))
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal, 30)
//                    .padding(.top, -20)
                
                let sortedExercises = exerciseData.exercises.sorted { $0.date < $1.date }

                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Welcome to ACTIVE")
                            .font(.custom("Futura", size: 30))
                            .foregroundStyle(Color.pale)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.text.opacity(0.8))
                            )
                            .padding(.top, 15)
                            .padding(.leading, 15)
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        // Header
                        Text("Upcoming:")
                            .foregroundStyle(Color.text)
                            .bold()
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)

                        // Check if there is an upcoming exercise
                        if sortedExercises.isEmpty {
                            Text("No upcoming exercise")
                                .foregroundStyle(Color.text)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                        } else {

                            let exercise1 = sortedExercises[0]

                            VStack(alignment: .leading, spacing: 0) {

                                // Exercise Card
                                VStack(alignment: .leading, spacing: 4) {

                                    HStack {
                                        Text(exercise1.name)
                                            .bold()
                                            .font(.headline)
                                        
                                        Text(exercise1.date.formatted(.dateTime.month().day().hour().minute()))
                                            .foregroundColor(.secondary)
                                        
                                        Spacer()
                                    }

                                    HStack {
                                        Text("Intensity: \(exercise1.intensity)")
                                        Spacer()
                                        Text("|")
                                        Spacer()
                                        Text("Duration: \(exercise1.duration) mins")
                                        Spacer()
                                        Text("|")
                                        Spacer()
                                        Text("Type: \(exercise1.type.name)")
                                    }
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                    .padding(.vertical, 5)

                                    Text("Reduce insulin by \(exercise1.insulin)% on \(exercise1.doseTime.formatted(.dateTime.month().day().hour().minute()))")
                                        .bold()
                                }
                                .foregroundStyle(Color.text)
                                .padding()
                                .background(Color.myGray.opacity(0.2))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
