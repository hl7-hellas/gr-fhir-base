Invariant: gr-hcp-base-name
Description: "given and family, or text SHOULD be present"
Severity: #warning
Expression: "(family.exists() and given.exists()) or text.exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Invariant: gr-hcp-base-address
Description: "line, city and postalCode, or text SHOULD be present"
Severity: #warning
Expression: "(line.exists() and city.exists() and postalCode.exists()) or text.exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Practitioner_Base
Parent: Practitioner
Id: practitioner-base
Title: "Practitioner profile: Greek base recommendations"
Description: """
Greek base recommendations for Practitioner profile.

The practitioner record shall be compliant with EU and Greek base recommendations, and records/provides:

_TBD_
"""

* ^experimental = false
* insert fmm-and-status(0, draft)

// Resource:
// id, meta, implicitRules, language

// DomainResource:
* text 0..1
* text ^short = "Human interpretable summary of the resource SHOULD be provided"
// contained
* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PractitionerEu)

// Practitioner resource:
* identifier 1..*
* identifier ^short = "Practitioner identifiers used in healthcare processes providing accurate practitioner and practitioner record identity. Practitioner identifiers SHOULD contain at least one identifier"
* identifier.value 1..1
* identifier.value ^short = "The actual value of an identifier SHALL be provided"
* identifier.system 1..1
* identifier.system ^short = "The issue of an identifier SHALL be provided, otherwise the identifier can't be unique across settings"
// active
* name 1..*
* name ^short = "Name of a practitioner containing parts of the full name SHALL be provided. Surname and family name parts SHOULD be recorded/provided without abbreviation or as initials"
* name obeys gr-hcp-base-name
* name.text 0..1
* name.text ^short  = "Practitioner's full name containing father's name SHOULD be recorded/provided. The full name as it SHOULD be presented/displayed to human reader."
* name.family 0..1
* name.family ^short = "Practitioner's family name without abbreviation or as initials"
* name.given 0..*
* name.given ^short = "Practitioner's given (first) name without abbreviation or as initials"
* telecom.value 1..1
* telecom.value ^short = "The actual value of contact information SHOULD be provided"
* gender 0..1
* gender ^short = "Practitioner gender for administration and record keeping purposes SHALL be recorded/provided"
// birthDate
// deceased[x]
* address 0..*
* address ^short = "Address of a practitioner SHALL provide either street name and house number, city, and postal code parts, or text be presented/displayed to human reader"
* address obeys gr-hcp-base-address
// photo
* qualification 1..*
* qualification ^short = "Practitioner record SHOULD contain at least one specialty"
* qualification.code from Practitioner_Specialties (preferred)
* qualification.code ^binding.description = "Example concepts defining practitioner's specialty"
// communication
