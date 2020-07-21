import fromBase64 from dw::core::Binaries

type Auth = {
    'type' : String,
    credentials : String
}

type BaiscAuth = {
    'type' : String,
    user : String,
    password : String
}
/**
 * Parses an Authentication header and returns type and credentials
 */
fun parseAuthentication(header: String) : Auth = do {
    var result = (header match /(Bearer|bearer) (.+)/)
---
    {
        'type' : result[1],
        credentials : result[2]
    }
}

/**
 * Parses a Basic Authentication header and returns Type, User and Password 
 */
fun parseBasicAuthentication(header: String) : BaiscAuth = do {
    var result = (header match /(Bearer|bearer) (.+)/)
    var userPass = (fromBase64(result[2]) as String) splitBy ":"
---
    {
        'type' : result[1],
        user : userPass[0],
        password : userPass[1]
    }
}