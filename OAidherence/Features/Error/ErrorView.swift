//
//  ErrorView.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2023-03-31.
//

import SwiftUI

struct ErrorView: View {
    private struct Constants {
        static let vStackSpacing: CGFloat = 80.0
        static let topPadding: CGFloat = 40.0
    }
    
    var viewModel: ErrorViewModel
    
    var body: some View {
        ZStack {
            Color.oysterBay
                .ignoresSafeArea(.all)
            
            VStack(spacing: Constants.vStackSpacing) {
                Text(L10n.ResultsView.results)
                    .font(.largeTitleBold)
                    .foregroundColor(.darkGray06)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Constants.topPadding)
                    
                
                Text(viewModel.errorText)
                    .font(.bodyBold)
                    .foregroundColor(.blueCharcoal)
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .padding(.horizontal, .mediumSpace)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(viewModel: .init(header: L10n.ResultsView.results, errorText: L10n.ResultsView.error))
    }
}

