//
//  AuthView.swift
//  TestSWUI
//
//  Created by TuPT on 18/10/2022.
//

import SwiftUI

struct AuthView {
    @StateObject var viewModel = AuthViewModel()
    @FocusState private var focusedField: Field?
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

extension AuthView : View {
    enum Field {
          case username
          case password
      }
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.blue,.red], startPoint:.topLeading, endPoint:.bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Account")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                    TextField("Enter you account", text: $viewModel.username)
                        .frame(maxWidth: .infinity,maxHeight: 20, alignment:.leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                        .focused($focusedField, equals: .username)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    Text("Password")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity,alignment:.leading)
                    SecureField("Enter you password", text: $viewModel.password)
                        .frame(maxWidth: .infinity,maxHeight: 20, alignment:.leading)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                        .focused($focusedField, equals: .password)
                        .disableAutocorrection(true)
                        .textInputAutocapitalization(.never)
                    Button(action: viewModel.handleLogin) {
                        Text("Login")
                    }
                    .frame(width: 200, height: 40, alignment: .center)
                    .foregroundColor(.white)
                    .font(.system(.headline))
                    .background(.brown)
                    .cornerRadius(25)
                    NavigationLink("", destination:  Navigation(), isActive: $viewModel.isLoginSuccess)
                }.padding()
            }.frame(maxWidth:.infinity, maxHeight:.infinity ,alignment: .center)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
        }
    }
}

