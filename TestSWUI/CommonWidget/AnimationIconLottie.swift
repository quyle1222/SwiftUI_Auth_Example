//
//  AnimationIconLottie.swift
//  TestSWUI
//
//  Created by TuPT on 19/10/2022.
//

import SwiftUI
import Lottie
struct AnimationIconLottie: UIViewRepresentable {
    let lottieFile: String
    let animationView = LottieAnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<AnimationIconLottie>) -> UIView {
        let view = UIView(frame: .zero)
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AnimationIconLottie>) {
        animationView.loopMode = .loop
    }
}
