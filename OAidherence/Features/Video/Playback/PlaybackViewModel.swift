//
//  PlaybackViewModel.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-19.
//

import SwiftUI

extension PlaybackView {
    class PlaybackViewModel: ObservableObject {
        private var apiHandler: APIHandler
        var videoFileURL: URL?
        
        @Published var recordingViewModel: RecordingView.RecordingViewModel
        
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
                    print("about to remove temp video")
                    self?.removeTemporaryVideo()
                }
            }
        }
        
        func removeTemporaryVideo() {
            if let videoFileURL = videoFileURL {
                print("video file exists")
                let path = videoFileURL.path
                
                guard FileManager.default.fileExists(atPath: path) else { return }
                
                do {
                    try FileManager.default.removeItem(atPath: path)
                    print("removed file at path \(videoFileURL)")
                } catch {
                    print("Error removing file at url: \(videoFileURL)")
                }
            } else {
                print("video file does not exist")
            }
        }
    }
}
