//
//  BlueButtonView.swift
//  Lumbly
//
//  Created by Yue chen Yu on 2023-02-21.
//

import SwiftUI

struct BlueButtonView: View {
    private struct Constants {
        static let cornerRadius: CGFloat = 15.0
        static let borderWidth: CGFloat = 3.0
    }
    
    var text: String
    var textColor: Color?
    var backgroundColor: Color?
    var borderColor: Color?
    var navLinkButton: Bool?
    var action: (() -> ())?
    
    var body: some View {
        if let navLinkButton = navLinkButton,
           navLinkButton {
            buttonBody
        } else {
            Button(action: action ?? { }) {
                buttonBody
            }
        }
    }
    
    private var buttonBody: some View {
        Text(text)
            .font(.title3Bold)
            .foregroundColor(textColor ?? .mercuryGrey)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                    .fill(backgroundColor ?? .resolutionBlue)
            )
            .overlay(
                RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
                    .strokeBorder(borderColor ?? .clear, lineWidth: Constants.borderWidth)
            )
    }
}

struct BlueButtonView_Previews: PreviewProvider {
    private struct Constants {
        static let wideWidth: CGFloat = 366.0
        static let narrowWidth: CGFloat = 177.0
        static let tallHeight: CGFloat = 56.0
        static let shortHeight: CGFloat = 49.0
    }
    
    static var previews: some View {
        VStack {
            BlueButtonView(text: L10n.ExerciseSetView.startExerciseSet,
                           backgroundColor: .veniceBlue,
                           borderColor: .blueCharcoal)
            
            BlueButtonView(text: L10n.ExerciseSetView.startExerciseSet,
                           backgroundColor: .veniceBlue)
            .frame(width: Constants.wideWidth, height: Constants.shortHeight)
            
            BlueButtonView(text: "Sign up")
            .frame(width: Constants.narrowWidth, height: Constants.tallHeight)
            
            BlueButtonView(text: "Log in",
                           textColor: .prussianBlue,
                           backgroundColor: .white,
                           borderColor: .resolutionBlue)
            .frame(width: Constants.narrowWidth, height: Constants.tallHeight)
            
            BlueButtonView(text: "Log in",
                           textColor: .prussianBlue,
                           backgroundColor: .white,
                           borderColor: .resolutionBlue,
                           navLinkButton: true)
            .frame(width: Constants.narrowWidth, height: Constants.tallHeight)
        }
    }
}
