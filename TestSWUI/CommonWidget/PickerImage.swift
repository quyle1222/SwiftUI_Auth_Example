//
//  PickerImage.swift
//  TestSWUI
//
//  Created by Tú Phạm on 01/12/2022.
//

import SwiftUI
import DSSwiftUIKit
protocol PickerImageDelegate {
    func setPickImage(isPick:Bool)
    func setHide()
}

extension PickerImageDelegate {
    func setHide(){}
}


struct PickerImage: View {
    var delegate: PickerImageDelegate
    var body: some View {
        FilePicker(documentTypes: ["*.png","*.jpg"]) {
            delegate.setPickImage(isPick: false)
        } resultAction: { fileResult in
            delegate.setPickImage(isPick: true)
        }
    }
}
