//
//  PlaybackViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

extension PlaybackView {
    class PlaybackViewModel {
        private var apiHandler: APIHandler
        var videoFileURL: URL?
        var recordingViewModel: RecordingView.RecordingViewModel
        
        init(recordingViewModel: RecordingView.RecordingViewModel, videoFileURL: URL?) {
            self.apiHandler = APIHandler()
            self.recordingViewModel = recordingViewModel
            self.videoFileURL = videoFileURL
        }
        
        func uploadVideo() {
            if let videoFileURL = videoFileURL {
                apiHandler.uploadVideo(parentExerciseSet: recordingViewModel.parentExerciseSet,
                                       exerciseName: recordingViewModel.exerciseName,
                                       videoFileURL: videoFileURL) { [weak self] in
                    let path = videoFileURL.path
                    
                    guard FileManager.default.fileExists(atPath: path) else { return }
                    
                    do {
                        try FileManager.default.removeItem(atPath: path)
                    } catch {
                        print("Error removing file at url: \(videoFileURL)")
                    }
                }
            }
        }
    }
}
