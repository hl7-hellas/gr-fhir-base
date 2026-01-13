Logical: GreekProfessional
Title: "Greek professional record logical model"
Description: """FHIR logical model of Greek professional record derived from the [Logical model](./logical-models.html#professional)"""
* identifier 1..* GreekIdentifier "An identifier of the professional that is unique within assigning authority. Professional can have multiple identifiers"
* name 1..1 GreekName "Professional's name - Name may contain distinct parts and it should contain at least full name as an unstructured text"
* gender 0..1 code "Professional's gender for administration"
* gender ^binding.description = "FEMALE | MALE"
* gender ^binding.strength = #example
* addresses 0..* GreekAddress "Professional's address(es) for contact purposes. Addresses may contain distinct parts (e.g., street address with house number, postal code, and city), and it should contain at least full address as an unstructured text"
* contacts 0..* GreekContact "Professional's communication contact points such are phone number or an email address"
* specialties 1..* code "Information about the professional's specialties"
* specialties ^binding.description = "GENERAL/FAMILY MEDICINE | CARDIOLOGY | PEDIATRICS | RADIOLOGY"
* specialties ^binding.strength = #example
