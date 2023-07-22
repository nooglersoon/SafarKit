import Foundation

// MARK: - ShalatSchedule
struct ShalatSchedule {
    let code: Int?
    let status: String?
    let data: DataResponse?
}

// MARK: - DataClass
struct DataResponse {
    let timings: Timings?
    let date: DateClass?
    let meta: Meta?
}

// MARK: - DateClass
struct DateClass {
    let readable, timestamp: String?
    let hijri: Hijri?
    let gregorian: Gregorian?
}

// MARK: - Gregorian
struct Gregorian {
    let date, format, day: String?
    let weekday: GregorianWeekday?
    let month: GregorianMonth?
    let year: String?
    let designation: Designation?
}

// MARK: - Designation
struct Designation {
    let abbreviated, expanded: String?
}

// MARK: - GregorianMonth
struct GregorianMonth {
    let number: Int?
    let en: String?
}

// MARK: - GregorianWeekday
struct GregorianWeekday {
    let en: String?
}

// MARK: - Hijri
struct Hijri {
    let date, format, day: String?
    let weekday: HijriWeekday?
    let month: HijriMonth?
    let year: String?
    let designation: Designation?
    let holidays: [Any?]?
}

// MARK: - HijriMonth
struct HijriMonth {
    let number: Int?
    let en, ar: String?
}

// MARK: - HijriWeekday
struct HijriWeekday {
    let en, ar: String?
}

// MARK: - Meta
struct Meta {
    let latitude, longitude: Double?
    let timezone: String?
    let method: Method?
    let latitudeAdjustmentMethod, midnightMode, school: String?
    let offset: [String: Int]?
}

// MARK: - Method
struct Method {
    let id: Int?
    let name: String?
    let params: Params?
    let location: Location?
}

// MARK: - Location
struct Location {
    let latitude, longitude: Double?
}

// MARK: - Params
struct Params {
    let fajr, isha: Int?
}

// MARK: - Timings
struct Timings {
    let fajr, sunrise, dhuhr, asr: String?
    let sunset, maghrib, isha, imsak: String?
    let midnight, firstthird, lastthird: String?
}
