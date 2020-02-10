/// Capable of verifying that a supplied password matches a hash.
public protocol PasswordVerifier {
    /// Verifies that the supplied password matches a given hash.
    func verify(_ password: LosslessDataConvertible, created hash: LosslessDataConvertible) throws -> Bool
}

/// Simply compares the password to the hash.
/// Don't use this in production.
public struct PlaintextVerifier: PasswordVerifier, Service {
    /// Create a new plaintext verifier.
    public init() {}

    /// See PasswordVerifier.verify
    public func verify(_ password: LosslessDataConvertible, created hash: LosslessDataConvertible) -> Bool {
        return password.convertToData() == hash.convertToData()
    }
}
