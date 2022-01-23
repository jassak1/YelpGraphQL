// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FranceQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query France {
      search(location: "France") {
        __typename
        business {
          __typename
          id
          name
          rating
          review_count
          photos
          url
          coordinates {
            __typename
            latitude
            longitude
          }
        }
      }
    }
    """

  public let operationName: String = "France"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("search", arguments: ["location": "France"], type: .object(Search.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.flatMap { (value: Search) -> ResultMap in value.resultMap }])
    }

    /// Search for businesses on Yelp.
    public var search: Search? {
      get {
        return (resultMap["search"] as? ResultMap).flatMap { Search(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Businesses"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("business", type: .list(.object(Business.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(business: [Business?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Businesses", "business": business.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of business Yelp finds based on the search criteria.
      public var business: [Business?]? {
        get {
          return (resultMap["business"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Business?] in value.map { (value: ResultMap?) -> Business? in value.flatMap { (value: ResultMap) -> Business in Business(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Business?]) -> [ResultMap?] in value.map { (value: Business?) -> ResultMap? in value.flatMap { (value: Business) -> ResultMap in value.resultMap } } }, forKey: "business")
        }
      }

      public struct Business: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Business"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("rating", type: .scalar(Double.self)),
            GraphQLField("review_count", type: .scalar(Int.self)),
            GraphQLField("photos", type: .list(.scalar(String.self))),
            GraphQLField("url", type: .scalar(String.self)),
            GraphQLField("coordinates", type: .object(Coordinate.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, name: String? = nil, rating: Double? = nil, reviewCount: Int? = nil, photos: [String?]? = nil, url: String? = nil, coordinates: Coordinate? = nil) {
          self.init(unsafeResultMap: ["__typename": "Business", "id": id, "name": name, "rating": rating, "review_count": reviewCount, "photos": photos, "url": url, "coordinates": coordinates.flatMap { (value: Coordinate) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Yelp ID of this business.
        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Name of this business.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// Rating for this business (value ranges from 1, 1.5, ... 4.5, 5).
        public var rating: Double? {
          get {
            return resultMap["rating"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
          }
        }

        /// Number of reviews for this business.
        public var reviewCount: Int? {
          get {
            return resultMap["review_count"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "review_count")
          }
        }

        /// URLs of up to three photos of the business.
        public var photos: [String?]? {
          get {
            return resultMap["photos"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "photos")
          }
        }

        /// URL for business page on Yelp.
        public var url: String? {
          get {
            return resultMap["url"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "url")
          }
        }

        /// The coordinates of this business.
        public var coordinates: Coordinate? {
          get {
            return (resultMap["coordinates"] as? ResultMap).flatMap { Coordinate(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "coordinates")
          }
        }

        public struct Coordinate: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Coordinates"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("latitude", type: .scalar(Double.self)),
              GraphQLField("longitude", type: .scalar(Double.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(latitude: Double? = nil, longitude: Double? = nil) {
            self.init(unsafeResultMap: ["__typename": "Coordinates", "latitude": latitude, "longitude": longitude])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The latitude of this business.
          public var latitude: Double? {
            get {
              return resultMap["latitude"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "latitude")
            }
          }

          /// The longitude of this business.
          public var longitude: Double? {
            get {
              return resultMap["longitude"] as? Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "longitude")
            }
          }
        }
      }
    }
  }
}
