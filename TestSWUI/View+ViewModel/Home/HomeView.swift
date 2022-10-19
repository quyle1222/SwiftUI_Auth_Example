//
//  HomeView.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import SwiftUI


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HomeView {
    @StateObject var viewModel = HomeViewModel()
}

extension HomeView : View{
    var body: some View {
        ZStack{
            VStack{
                List(viewModel.listItem, id: \.url){ item in
                        AsyncImage(url: URL(string: item.url ?? "" )) { image in
                                   image
                                       .resizable()
                                       .scaledToFill()
                               } placeholder: {
                                   Color.red.opacity(0.5)
                               }
                               .frame(width: .infinity, height: 200,alignment: .center)
                               .cornerRadius(10)
                   
                    Text(item.url ?? "")
                }
            }
        }.onAppear(
            perform: {
                viewModel.setTitle()
            }
        )
    }
}

