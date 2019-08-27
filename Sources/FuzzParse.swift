@_cdecl("LLVMFuzzerTestOneInput")
public func fuzzMe(data: UnsafePointer<CChar>, size: CInt) -> CInt {
    let decoded = String(validatingUTF8: data)
    if let html = decoded {
        do {
            try parse(html)
            return 1
        } catch {
            return 0
        }
    } else {
        return 0
    }
}
