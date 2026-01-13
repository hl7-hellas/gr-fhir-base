Logical: GreekService
Title: "Greek service record logical model"
Description: """FHIR logical model of Greek service record derived from the [Logical model](./logical-models.html#service)"""
* identifier 1..1 GreekIdentifier "An identifier of the service that is unique within assigning authority"
* name 1..1 string "Service's name"
* type 1..1 code "Service's type"
* type ^binding.description = "MAGNETIC ANGIOGRAPHY | RADIOISOTOPIC CYSTOGRAM | BIOPSIES NEPHROSTOMIES | CT SCAN"
* type ^binding.strength = #example
* category 0..1 code "High-level service's category"
* category ^binding.description = "DIAGNOSTIC PROCEDURES | IMAGING DIAGNOSTIC METHODS | SURGICAL PROCEDURES | NON-SURGICAL THERAPEUTIC PROCEDURES | OTHER PROCEDURES"
* category ^binding.strength = #example
* address 0..1 GreekAddress "Service's address for contact purposes"
* contacts 0..* GreekContact "Service's communication contact points such are phone number or an email address"
* provider 1..1 GreekProvider "Provider's parent organization"
