//
//  HomeView.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import SwiftUI
import DSSwiftUIKit

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

struct HomeView {
    @StateObject var viewModel = HomeViewModel()
    var setHiddenTabBar:(Bool) -> Void
}

extension HomeView : View{
    var body: some View {
        ZStack{
            VStack{
                List(viewModel.listMovies, id: \.id){ item in
                    AsyncImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(item.backdrop_path )")) { image in
                                   image
                                       .resizable()
                                       .scaledToFill()
                               } placeholder: {
                                   Color.red.opacity(0.5)
                               }
                               .frame(minWidth: 0, maxWidth:.infinity, minHeight: 200, alignment: .center)
                               .cornerRadius(10)
                }
            }
        }.onAppear(
            perform: {
                viewModel.getListMovieTrending()
                viewModel.setTitle()
            }
        )
    }
}

