Invariant: gr-pat-base-name
Description: "given and family, or text SHOULD be present"
Severity: #warning
Expression: "(family.exists() and given.exists()) or text.exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Invariant: gr-pat-base-address
Description: "line, city and postalCode, or text SHOULD be present"
Severity: #warning
Expression: "(line.exists() and city.exists() and postalCode.exists()) or text.exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Patient_Base
Parent: Patient
Id: patient-base
Title: "Patient profile: Greek base recommendations"
Description: """
Greek base recommendations for Patient profile.

The patient record shall be compliant with EU and Greek base recommendations, and records/provides:

- text, as a human interpretable/readable summary
- place of birth (via extension)
- identifier(s)
- name(s) and father's and mother's names (via extensions)
- telecom(s): contact information
- gender
- birthdate (and time, via extension)
- address(es)
- multiple births indicator, indicating which one in order was patient (indicating that patient has tween sibling(s)) and how many has been born (via extension)

___to be discussed:___

- deceased status/flag
- patient's personal doctor
- patient's record managing organization
"""

* ^experimental = false
* insert fmm-and-status(0, draft)

// Resource:
// id, meta, implicitRules, language

// DomainResource:
* text 0..1
* text ^short = "Human interpretable summary of the resource SHOULD be provided"
// contained
* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEu)
// PatBirthPlace http://hl7.org/fhir/StructureDefinition/patient-birthPlace
* extension contains PatBirthPlace named birthPlace 0..1
* extension[birthPlace] ^short = "The place of birth of the patient SHOULD be recorded/provided and it SHOULD contain at least city and postal code if known. If the information is not available as structured elements, the 'text' element could be used."
* extension[birthPlace].valueAddress.city 1..1
* extension[birthPlace].valueAddress.city ^short = "The city of birth of the patient SHOULD be recorded/provided"
* extension[birthPlace].valueAddress.postalCode 1..1
* extension[birthPlace].valueAddress.postalCode ^short = "The postal code of birth of the patient SHOULD be recorded/provided"
// modifierExtension

// Patient resource:
* identifier 1..*
* identifier ^short = "Patient identifiers used in healthcare processes providing accurate patient and patient record identity. Patient identifiers SHOULD contain at least one and it SHOULD be an AMKA identifier"
* identifier.value 1..1
* identifier.value ^short = "The actual value of an identifier SHALL be provided"
* identifier.system 1..1
* identifier.system ^short = "The issue of an identifier SHALL be provided, otherwise the identifier can't be unique across settings"
// active
* name 1..*
* name ^short = "Name of a patient containing parts of the full name SHALL be provided. Surname and family name parts SHOULD be recorded/provided without abbreviation or as initials"
* name obeys gr-pat-base-name
* name.text 0..1
* name.text ^short  = "Patient's full name containing father's name SHOULD be recorded/provided. The full name as it SHOULD be presented/displayed to human reader."
* name.family 0..1
* name.family ^short = "Patient's family name without abbreviation or as initials"
* name.family.extension contains FathersFamily named fatherName 0..1 // http://hl7.org/fhir/StructureDefinition/humanname-fathers-family
* name.family.extension[fatherName] ^short = "Patient's name in Greece SHOULD record/provide father's name if known"
* name.family.extension contains MothersFamily named motherName 0..1 // http://hl7.org/fhir/StructureDefinition/humanname-mothers-family
* name.family.extension[motherName] ^short = "Patient's mother name SHOULD be recorded/provided if known"
* name.given 0..*
* name.given ^short = "Patient's given (first) name without abbreviation or as initials"
* telecom.value 1..1
* telecom.value ^short = "The actual value of contact information SHOULD be provided"
* gender 1..1
* gender ^short = "Patient gender for administration and record keeping purposes SHALL be recorded/provided"
* birthDate 1..1
* birthDate ^short  = "Patient's date of birth SHALL be recorded/provided"
* birthDate.extension contains PatBirthTime named birthTime 0..1 // https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-patient-birthTime.html
* birthDate.extension[birthTime] ^short = "Patient's birth time, (required in Neonatology) to complement birthDate providing precision, SHOULD be recorded/provided if known"
// deceased[x]
* address 0..*
* address ^short = "Address of a patient SHALL provide either street name and house number, city, and postal code parts, or text be presented/displayed to human reader"
* address obeys gr-pat-base-address
// maritalStatus
* multipleBirth[x] ^short = "If patient was born with siblings, the value SHOULD be recorded"
* multipleBirth[x].extension contains PatMultipleBirthTotal named multiBirthTotal 0..1 // http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal
* multipleBirth[x].extension[multiBirthTotal] ^short = "Number of patient's siblings born at the same birth time"
// photo
// contact
// communication
// generalPractitioner
// managingOrganization
// link
