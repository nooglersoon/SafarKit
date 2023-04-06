import Foundation

struct ErrorResponse: Decodable, Error {
    let status: String
    let message: [String]
    let data: ErrorResponseData?
}

struct ErrorResponseData: Decodable {
    let data: [String]
}
