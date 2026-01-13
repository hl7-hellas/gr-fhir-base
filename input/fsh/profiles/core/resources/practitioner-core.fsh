Invariant: gr-hcp-core-name
Description: "given and family, or text, or a data-absent-reason extension SHALL be present"
Severity: #error
Expression: "(family.exists() and given.exists()) or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Invariant: gr-hcp-core-address
Description: "line, city and postalCode, or a data-absent-reason extension SHALL be present"
Severity: #error
Expression: "((line.exists() and city.exists() and postalCode.exists()) or text.exists()) or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Greek_Practitioner
Parent: Practitioner_Base
Id: greek-practitioner
Title: "Practitioner profile: Greek core requirements"
Description: """
Greek core requirements for Practitioner profile.

The practitioner record shall be compliant with EU and Greek core requirements, and records/provides:

_TBD_
"""

* ^experimental = false
* insert fmm-and-status(0, draft)

// Resource:
// id, meta, implicitRules, language

// DomainResource:
* text 0..1
* text ^short = "Human interpretable summary of the resource SHALL be provided"
// contained
* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PractitionerEuCore)

* identifier ^short = "Practitioner identifiers used in healthcare processes providing accurate practitioner and practitioner record identity. Practitioner identifiers SHALL contain at a Medical license number"
* identifier
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "system"
  * ^slicing.rules = #open
* identifier contains medlic 1..1 MS
* identifier[medlic] ^short = "Medical license number is required identifier"
* identifier[medlic].use 1..1 MS
* identifier[medlic].use ^short = "Medical license number is official"
* identifier[medlic].use = #official
* identifier[medlic].type 1..1 MS
* identifier[medlic].type ^short = "Medical license number is a national insurance number"
* identifier[medlic].type = http://terminology.hl7.org/CodeSystem/v2-0203#MD "Medical License number"
* identifier[medlic].system 1..1 MS
* identifier[medlic].system ^short = "Medical license number is issued by 2.16.840.1.113883.2.25.3.4.1.1.3"
* identifier[medlic].system = $HCP-SYS
* identifier[medlic].value 1..1 MS
* identifier[medlic].value ^short = "The value of Medical license number"
// active
* name 1..* MS
* name ^short = "Name of a practitioner containing parts of the full name SHALL be provided. Surname and family name parts SHALL be recorded/provided without abbreviation or as initials"
* name obeys gr-hcp-core-name
* name.extension contains DataAbsentReason named dataAbsentReason 0..1 // http://hl7.org/fhir/StructureDefinition/data-absent-reason
* name.extension[dataAbsentReason] ^short = "Reason for missing practitioner's name. If practitioner's name is missing, the reason for missing SHALL be recorded/provided"
// telecom inherited from Base
// gender
// birthDate
// deceased[x]
* address 1..* MS
* address ^short = "Address of a practitioner SHALL provide either street name and house number, city, and postal code parts, or text be presented/displayed to human reader"
* address obeys gr-hcp-core-address
* address.extension contains DataAbsentReason named dataAbsentReason 0..1 // http://hl7.org/fhir/StructureDefinition/data-absent-reason
* address.extension[dataAbsentReason] ^short = "Reason for missing practitioner's address. If practitioner's address is missing, the reason for missing SHALL be recorded/provided"
// photo
* qualification.code from Practitioner_Specialties (required)
* qualification.code ^binding.description = "Concepts defining practitioner's specialty"
// communication
