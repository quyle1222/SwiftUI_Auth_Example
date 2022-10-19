//
//  ContentView.swift
//  TestSWUI
//
//  Created by TuPT on 05/10/2022.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State var username: String = ""
//    @State var password: String = ""
//    @State var isHidden: Bool = true
//
//    var body: some View {
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint:.topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
//            VStack {
//                Text("Account").frame(maxWidth: .infinity, alignment: .leading)
//                TextField("Enter username...", text: $username)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                Text("Password").frame(maxWidth: .infinity, alignment: .leading)
//                if isHidden {
//                    SecureField("Enter password...", text: $password)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                } else {
//                    TextField("Enter password...", text: $password)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                }
//                Button(isHidden ? "Show password": "Hide password",action: showHiddenPassword).foregroundColor(.white)
//                CustomButton(title: $username)
//                Button("Login", action: onClick).padding()
//                    .frame(minWidth: 0, maxWidth: 200)
//                    .foregroundColor(.white)
//                    .background(.blue)
//                    .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.white, lineWidth: 1))
//                    .cornerRadius(25)
//            }.padding()
//             .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
//        }
//    }
//}
//
////struct ContentView_Previews: PreviewProvider {
////    static var previews: some View {
////        ContentView().previewInterfaceOrientation(.portrait).previewDevice(PreviewDevice(rawValue: "iPhone Xs"))
////    }
////}
//
//extension ContentView {
//    func onClick(){
//    }
//
//    func showHiddenPassword (){
//        self.isHidden = !self.isHidden
//    }
//}
