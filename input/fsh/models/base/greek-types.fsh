Logical: GreekIdentifier
Title: "Greek identifier logical model"
Description: """FHIR logical model of Greek identifier (patient, practitioner, but also device) derived from the [Logical models](./logical-models.html)"""
* value 1..1 string "The unique value of this identifier"
* issuer 1..1 string "Issuer of this identifier"
* type 0..1 code "The type of this identifier to be used to determine a purpose of use of this identifier"
* type ^binding.description = "PASSPORT NUMBER | MEDICAL RECORD NUMBER | TAX ID | NATIONAL INSURANCE ID | SOCIAL BENEFICIARY ID | EMPLOYER NUMBER | PROVIDER NUMBER | MEDICAL LICENSE NUMBER | FILLER ID | DEVICE ID | SERIAL NUMBER"
* type ^binding.strength = #example
////////////////////////////////////////////////////////////////////////////////////////////////////
Logical: GreekName
Title: "Greek name logical model"
Description: """FHIR logical model of Greek human name derived from the [Logical models](./logical-models.html)"""
* text 0..1 string "The full name as it should be presented/displayed to human reader. This should be provided regardless if family and given are available separately"
* family 0..1 string "The last name of a person"
* given 0..1 string "The first name of a person"
* fatherName 0..1 string "The father's name of a person"
////////////////////////////////////////////////////////////////////////////////////////////////////
Logical: GreekAddress
Title: "Greek address logical model"
Description: """FHIR logical model of Greek address derived from the [Logical models](./logical-models.html)"""
* text 0..1 string "The full address as it should be presented/displayed to human reader"
* use 0..1 code "Information about the address' purpose"
* use ^binding.description = "HOME | WORK | OLD"
* use ^binding.strength = #example
* streetName 0..1 string "Name of the street"
* houseNumber 0..1 string "House number"
* city 0..1 string "City"
* postalCode 0..1 string "Postal code"
* country 0..1 code "Country name (and country code)"
* country ^binding.description = "#GR \"Greece\" | #CY \"Cyprus\" | #MK \"North Macedonia\" | #AL \"Albania\""
* country ^binding.strength = #example
////////////////////////////////////////////////////////////////////////////////////////////////////
Logical: GreekContact
Title: "Greek contact point logical model"
Description: """FHIR logical model of Greek contact point derived from the [Logical models](./logical-models.html)"""
* value 1..1 string "The actual contact point details"
* type 0..1 code "Information about contact point type"
* type ^binding.description = "PHONE | EMAIL"
* type ^binding.strength = #example
* use 0..1 code "Information about contact point use"
* use ^binding.description = "HOME | WORK | OLD"
* use ^binding.strength = #example
