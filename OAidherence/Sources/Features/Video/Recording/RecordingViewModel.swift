//
//  RecordingViewModel.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-03-30.
//

import SwiftUI

extension RecordingView {
    class RecordingViewModel: ObservableObject {
        @Published private(set) var parentExerciseSet: String
        @Published private(set) var exerciseName: String
        @Published private(set) var recordingInfoModalBodyText: String?
        
        @Published var timestamp: String?
        @Published var isTestRun: Bool
        
        var parentView: ExerciseInstructionsView
        
        init(isTestRun: Bool,
             parentExerciseSet: String,
             exerciseName: String,
             recordingInfoModalBodyText: String? = nil,
             timestamp: String? = nil,
             parentView: ExerciseInstructionsView) {
            self.isTestRun = isTestRun
            self.parentExerciseSet = parentExerciseSet
            self.exerciseName = exerciseName
            self.timestamp = timestamp
            self.recordingInfoModalBodyText = recordingInfoModalBodyText
            self.parentView = parentView
        }
    }
}
