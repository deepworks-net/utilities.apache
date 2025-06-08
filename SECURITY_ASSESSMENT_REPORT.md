# Apache Scripts Security Assessment Report
*Date: June 8, 2025*

## Executive Summary

This security assessment identifies version disparities and potential security improvements for the Apache Scripts build system. While the current configuration has good security practices (SSL2/3 disabled, weak ciphers disabled), there are opportunities to modernize and enhance security further.

## Current Version Analysis

### Components and Their Versions

| Component | Current Version | Latest Stable | Status | Notes |
|-----------|----------------|---------------|--------|--------|
| **Apache httpd** | 2.4.54 | 2.4.62+ | ⚠️ OUTDATED | Multiple security fixes available |
| **OpenSSL** | 1.1.1s | 3.0.x / 3.3.x | ⚠️ OUTDATED | 1.1.1 series EOL September 2023 |
| **APR** | 1.7.0 | 1.7.5 | ⚠️ OUTDATED | Security and bug fixes available |
| **APR-util** | 1.6.1 | 1.6.3 | ⚠️ OUTDATED | Security improvements available |
| **mod_fcgid** | 2.3.9 | 2.3.9 | ✅ CURRENT | Latest stable version |

## Security Findings

### 1. **Critical: OpenSSL 1.1.1 Series End of Life**
- OpenSSL 1.1.1 series reached end of life in September 2023
- No longer receives security updates
- Should migrate to OpenSSL 3.0.x (LTS until 2026) or 3.3.x

### 2. **Apache httpd Version Gap**
- Current: 2.4.54 (released June 2022)
- Latest: 2.4.62+ (as of 2025)
- Missing 2+ years of security patches and improvements

### 3. **TLS Configuration - Partially Secure**
✅ **Good Security Practices Found:**
- SSL2 disabled (`E_SSL2: no`)
- SSL3 disabled (`E_SSL3: no`)
- Weak SSL ciphers disabled (`E_WEAK_SSL_CIPHERS: no`)
- Deprecated algorithms disabled (IDEA, MDC2, RC5, etc.)

⚠️ **Security Improvements Needed:**
- TLS 1.0 and TLS 1.1 not explicitly disabled
- No cipher suite configuration for Apache
- No explicit TLS protocol settings in Apache config

### 4. **Missing Security Configurations**
- No `ssl_configure.sh` file found (referenced in cleanup instructions)
- No explicit Apache SSL protocol configuration
- No modern cipher suite definitions

## Recommendations by Priority

### 🔴 Priority 1: Address End-of-Life Components
1. **Upgrade OpenSSL to 3.0.x or 3.3.x**
   - Major version change requires testing
   - API changes may affect Apache compilation
   - Provides long-term support and modern cryptography

2. **Update Apache httpd to 2.4.62+**
   - Includes 2+ years of security fixes
   - Maintains compatibility with 2.4.x series

### 🟡 Priority 2: Enhance TLS Security
1. **Explicitly disable TLS 1.0 and 1.1** in OpenSSL configs:
   ```
   E_TLS1: no
   E_TLS1_1: no
   ```

2. **Create Apache SSL configuration** with:
   - `SSLProtocol -all +TLSv1.2 +TLSv1.3`
   - Modern cipher suite configuration
   - HSTS header support

### 🟢 Priority 3: Update Supporting Libraries
1. **APR 1.7.0 → 1.7.5**
   - Security and stability improvements
   - Maintains API compatibility

2. **APR-util 1.6.1 → 1.6.3**
   - Bug fixes and security enhancements
   - Compatible with APR 1.7.x

## Compatibility Considerations

### Distribution Support
- **Alpine Linux**: Uses musl libc, test OpenSSL 3.x compatibility
- **CentOS 7**: May need backported libraries for OpenSSL 3.x
- **CentOS 8/RockyLinux**: Should support all updates natively

### Breaking Changes
- OpenSSL 1.1.1 → 3.x is a major version change
- Some deprecated APIs removed
- Requires thorough testing on all platforms

## Next Steps

1. **Create test branch** for version updates
2. **Update one component at a time** starting with APR/APR-util
3. **Test on all supported distributions**
4. **Document any API changes or build adjustments**
5. **Update SHA256 checksums** for new versions

## Files Requiring Updates

1. `/scripts/sources/openssl-src.sh` - OpenSSL version
2. `/scripts/sources/httpd-src.sh` - Apache, APR, APR-util versions
3. `/scripts/sources/sums/` - Add new checksum files
4. `/scripts/configs/openssl/config.options` - TLS 1.0/1.1 settings
5. `/docs/sources/index.md` - Documentation updates

---

*Note: This assessment is based on publicly available information about stable releases and known security advisories as of June 2025. Always verify with official project security advisories before proceeding with updates.*