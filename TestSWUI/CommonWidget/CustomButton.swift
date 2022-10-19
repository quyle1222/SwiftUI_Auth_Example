//
//  CustomButton.swift
//  TestSWUI
//
//  Created by TuPT on 17/10/2022.
//

import SwiftUI

struct CustomButton: View {
    @Binding var title: String
    var body: some View {
        Text(title)
    }
}

