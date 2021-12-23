//
//  books.swift
//  E-book
//
//  Created by Daniyal Hussain on 29/11/2021.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct books: Codable {
    var kind: String?
    var totalItems: Int?
    var items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    var kind: Kind?
    var id, etag: String?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    var saleInfo: SaleInfo?
    var accessInfo: AccessInfo?
    var searchInfo: SearchInfo?
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    var country: String?
    var viewability: Viewability?
    var embeddable, publicDomain: Bool?
    var textToSpeechPermission: TextToSpeechPermission?
    var epub, pdf: Epub?
    var webReaderLink: String?
    var accessViewStatus: AccessViewStatus?
    var quoteSharingAllowed: Bool?
}

enum AccessViewStatus: String, Codable {
    case none = "NONE"
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case us = "US"
}

// MARK: - Epub
struct Epub: Codable {
    var isAvailable: Bool?
    var acsTokenLink: String?
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
}

enum Viewability: String, Codable {
    case allPages = "ALL_PAGES"
    case noPages = "NO_PAGES"
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    var country: String?
    var saleability: Saleability?
    var isEbook: Bool?
    var listPrice, retailPrice: SaleInfoListPrice?
    var buyLink: String?
    var offers: [Offer]?
}

// MARK: - SaleInfoListPrice
struct SaleInfoListPrice: Codable {
    var amount: Double?
    var currencyCode: CurrencyCode?
}

enum CurrencyCode: String, Codable {
    case usd = "USD"
}

// MARK: - Offer
struct Offer: Codable {
    var finskyOfferType: Int?
    var listPrice, retailPrice: OfferListPrice?
    var giftable: Bool?
    var rentalDuration: RentalDuration?
}

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    var amountInMicros: Int?
    var currencyCode: CurrencyCode?
}

// MARK: - RentalDuration
struct RentalDuration: Codable {
    var unit: String?
    var count: Int?
}

enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case forSaleAndRental = "FOR_SALE_AND_RENTAL"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    var textSnippet: String?
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    var title, publisher: String?
    var readingModes: ReadingModes?
    var printType: PrintType?
    var maturityRating: MaturityRating?
    var allowAnonLogging: Bool?
    var contentVersion: String?
    var imageLinks: ImageLinks?
    var language: Language?
    var previewLink: String?
    var infoLink: String?
    var canonicalVolumeLink: String?
    var subtitle: String?
    var authors: [String]?
    var publishedDate, volumeInfoDescription: String?
    var industryIdentifiers: [IndustryIdentifier]?
    var pageCount: Int?
    var categories: [String]?
    var panelizationSummary: PanelizationSummary?
    var averageRating, ratingsCount: Int?

    enum CodingKeys: String, CodingKey {
        case title, publisher, readingModes, printType, maturityRating, allowAnonLogging, contentVersion, imageLinks, language, previewLink, infoLink, canonicalVolumeLink, subtitle, authors, publishedDate
        case volumeInfoDescription = "description"
        case industryIdentifiers, pageCount, categories, panelizationSummary, averageRating, ratingsCount
    }
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    var smallThumbnail, thumbnail: String?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    var type: String?
    var identifier: String?
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}

enum Language: String, Codable {
    case en = "en"
}

enum MaturityRating: String, Codable {
    case mature = "MATURE"
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    var containsEpubBubbles, containsImageBubbles: Bool?
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    var text, image: Bool?
}
