## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----basic-usage, eval=FALSE--------------------------------------------------
# library(punycoder)
# 
# # Encode Unicode domains to ASCII
# puny_encode("café.com")
# # Returns: "xn--caf-dma.com"
# 
# puny_encode("москва.рф")
# # Returns: "xn--80adxhks.xn--p1ai"
# 
# # Decode ASCII domains back to Unicode
# puny_decode("xn--caf-dma.com")
# # Returns: "café.com"
# 
# # Vectorized operations
# domains <- c("café.com", "москва.рф", "北京.中国")
# encoded <- puny_encode(domains)
# print(encoded)

## ----url-processing, eval=FALSE-----------------------------------------------
# # Encode URLs with Unicode domains
# url_encode(paste0("https", "://", "café.example.com/menu"))
# 
# # Decode URLs back to Unicode
# url_decode(paste0("https", "://", "xn--caf-dma.example.com/menu"))
# 
# # Parse URLs with IDN handling
# url_parts <- parse_url(
#   paste0("https", "://", "café.example.com:8080/path?q=test#section")
# )
# print(url_parts)

## ----validation, eval=FALSE---------------------------------------------------
# # Check if domain is already punycode
# is_punycode("xn--caf-dma.com") # TRUE
# is_punycode("café.com") # FALSE
# 
# # Check if domain contains Unicode characters
# is_idn("café.com") # TRUE
# is_idn("example.com") # FALSE
# 
# # Comprehensive domain validation
# result <- validate_domain(c("café.com", "invalid..domain", "valid.org"))
# print(result)

## ----web-scraping, eval=FALSE-------------------------------------------------
# # Example: Processing international URLs for web scraping
# international_hosts <- c("café.paris.fr", "москва.рф", "北京.中国")
# international_paths <- c("/menu", "/news", "/info")
# international_urls <- paste0(
#   "https",
#   "://",
#   international_hosts,
#   international_paths
# )
# 
# # Convert to ASCII for HTTP requests
# ascii_urls <- url_encode(international_urls)
# print(ascii_urls)
# 
# # Process the data...
# 
# # Convert back to Unicode for display
# display_urls <- url_decode(ascii_urls)
# print(display_urls)

## ----bulk-processing, eval=FALSE----------------------------------------------
# # Example: Processing large datasets
# set.seed(123)
# sample_domains <- c(
#   rep("example.com", 1000),
#   rep("café.com", 1000),
#   rep("test.org", 1000)
# )
# 
# # Efficient vectorized encoding
# system.time({
#   encoded_domains <- puny_encode(sample_domains)
# })
# 
# # Check results
# table(is_punycode(encoded_domains))

## ----error-handling, eval=FALSE-----------------------------------------------
# # Strict validation (default)
# try({
#   puny_encode(c("valid.com", "")) # Empty string causes error
# })
# 
# # Non-strict mode returns NA for invalid input
# result <- puny_encode(c("valid.com", ""), strict = FALSE)
# print(result)
# 
# # Validation provides detailed error information
# validation <- validate_domain(c("valid.com", "invalid..domain", ""))
# print(validation)

## ----performance, eval=FALSE--------------------------------------------------
# # Benchmark with large dataset
# large_domains <- rep(c("example.com", "café.com"), 5000)
# 
# system.time({
#   encoded <- puny_encode(large_domains)
# })
# 
# # Should process 10,000+ domains per second

## ----options, eval=FALSE------------------------------------------------------
# # Set global strict validation
# options(punycoder.strict = FALSE)
# 
# # Check current setting
# getOption("punycoder.strict")
# 
# # Set encoding preference
# options(punycoder.encoding = "UTF-8")

## ----integration, eval=FALSE--------------------------------------------------
# # With data.table
# library(data.table)
# dt <- data.table(
#   original = c("café.com", "москва.рф"),
#   encoded = puny_encode(c("café.com", "москва.рф"))
# )
# 
# # With dplyr
# library(dplyr)
# urls_df <- data.frame(
#   unicode_url = paste0("https", "://", c("café.com", "москва.рф"))
# ) |>
#   mutate(
#     ascii_url = url_encode(unicode_url),
#     is_international = is_idn(unicode_url)
#   )

