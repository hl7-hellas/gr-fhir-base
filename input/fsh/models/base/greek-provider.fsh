Logical: GreekProvider
Title: "Greek provider record logical model"
Description: """FHIR logical model of Greek provider record derived from the [Logical model](./logical-models.html#provider)"""
* identifier 1..1 GreekIdentifier "An identifier of the provider that is unique within assigning authority"
* name 1..1 string "Provider's name"
* type 0..1 code "Provider's type"
* type ^binding.description = "PRIMARY HEALTH CARE UNIT | MUNICIPAL CLINIC | REGIONAL CLINIC | DAY CARE UNIT | HOSPITAL"
* type ^binding.strength = #example
* address 0..1 GreekAddress "Provider's address for administrative and contact purposes"
* contacts 0..* GreekContact "Provider's communication contact points such are phone number or an email address"
* parent 0..1 GreekProvider "Provider's parent organization"
