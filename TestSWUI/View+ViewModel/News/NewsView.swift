//
//  News.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import SwiftUI

struct NewsView {
    @StateObject private var viewModel = NewsViewModel()
}

extension NewsView: View {
    var body: some View {
        ZStack{
            VStack {
                AnimationIconLottie(lottieFile: "circle-loading")
                    .scaledToFill()
                    .frame(width: 98, height: 86)
                    .background(.clear)
                Button {
                    viewModel.showAlert()
                } label: {
                    Text("Show dialog")
                }.frame(width: 200, height: 35, alignment: .center)
                    .background(.cyan)
                    .foregroundColor(.white)
                    .font(.callout)
                    .cornerRadius(20)
            }.alert(isPresented: $viewModel.isShowAlert, content: {
                Alert(title: Text(viewModel.alertMessage?.title ?? ""), message: Text(viewModel.alertMessage?.message ?? ""),
                      dismissButton: .cancel())
            })
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
