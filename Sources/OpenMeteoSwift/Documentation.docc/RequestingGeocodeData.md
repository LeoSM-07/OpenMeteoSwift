# Requesting Geocode Data

Search locations in any language globally

## Overview

The Geocoding API allows for the searching of cities and other sites. See the full API explorer on the [official Open-Meteo website](https://open-meteo.com/en/docs/geocoding-api) 

An example geocode request could look like the following:
```swift
let result = await OpenMeteo().geocode(
    "paris",
    language: "en",
    resultCount: 10
)

if let error = result.error {
    // Handle Error
} else if let data = result.data {
    // Handle Data
}
```

