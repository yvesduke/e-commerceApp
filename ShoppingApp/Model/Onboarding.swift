//
//  Onboarding.swift
//  ShoppingApp
//
//  Created by Yves Dukuze on 25/10/2023.
//

import Foundation


struct OnboardingModel: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let objectImage: String
    let titleLabel: String
    let subTitleLabel: String

    static let list: [OnboardingModel] = [
        OnboardingModel(id: 0, backgroundImage: "onboarding-bg-1", objectImage: "onboarding-object-1", titleLabel: "EXPLORE PRODUCTS", subTitleLabel: "Lorem ipsum dolor sit amet, audiam denique eu mei, ne mutat quaeque forensibus vis, vix quem alia consequuntur ea. Eu eum magna quaeque similique."),
        OnboardingModel(id: 1, backgroundImage: "onboarding-bg-2", objectImage: "onboarding-object-2", titleLabel: "EASY PAYMENT", subTitleLabel: "Lorem ipsum dolor sit amet, audiam denique eu mei, ne mutat quaeque forensibus vis, vix quem alia consequuntur ea. Eu eum magna quaeque similique."),
        OnboardingModel(id: 2, backgroundImage: "onboarding-bg-3", objectImage: "onboarding-object-3", titleLabel: "QUICK DELIVERY", subTitleLabel: "Lorem ipsum dolor sit amet, audiam denique eu mei, ne mutat quaeque forensibus vis, vix quem alia consequuntur ea. Eu eum magna quaeque similique.")
    ]
}
