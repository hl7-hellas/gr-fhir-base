Invariant: gr-pat-base-name
Description: "given and family, or text SHOULD be present"
Severity: #warning
Expression: "(family.exists() and given.exists()) or text.exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: HumanName_Base
Parent: HumanName
Id: human-name-base
Title: "HumanName profile: Greek base recommendations"
Description: """Greek base recommendations for HumanName profile."""

* ^experimental = false

* obeys gr-pat-core-name

* insert should-not-be-populated(id)
* insert should-not-be-populated(extension)

* text 0..1
* text ^short  = "Patient's full name containing father's name SHOULD be recorded/provided. The full name as it SHOULD be presented/displayed to human reader."
* insert should-not-be-populated(use)
* family 0..1
* family ^short = "Patient's family name without abbreviation or as initials"
// FathersFamily http://hl7.org/fhir/StructureDefinition/humanname-fathers-family
* family.extension contains FathersFamily named fatherName 0..1
* family.extension[fatherName] ^short = "Patient's name in Greece SHOULD record/provide father's name if known"
// MothersFamily http://hl7.org/fhir/StructureDefinition/humanname-mothers-family
* family.extension contains MothersFamily named motherName 0..1
* family.extension[motherName] ^short = "Patient's mother name SHOULD be recorded/provided if known"
* given 0..*
* given ^short = "Patient's given (first) name without abbreviation or as initials"
* insert should-not-be-populated(prefix)
* insert should-not-be-populated(suffix)
* insert should-not-be-populated(period)
