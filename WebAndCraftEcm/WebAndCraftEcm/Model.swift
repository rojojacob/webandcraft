//
//  Model.swift
//  WebAndCraftEcm
//
//  Created by Rojo Jacob on 26/05/23.
//
import Foundation

// MARK: - HomeResponse
struct HomeResponse: Codable {
    var status: Bool?
    var homeData: [HomeDatum]?
}

// MARK: - HomeDatum
struct HomeDatum: Codable {
    var type: String?
    var values: [Value]?
}

// MARK: - Value
struct Value: Codable {
    var id: Int?
    var name: String?
    var imageURL, bannerURL: String?
    var image: String?
    var actualPrice, offerPrice: String?
    var offer: Int?
    var isExpress: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name
        case imageURL = "image_url"
        case bannerURL = "banner_url"
        case image
        case actualPrice = "actual_price"
        case offerPrice = "offer_price"
        case offer
        case isExpress = "is_express"
    }
}
