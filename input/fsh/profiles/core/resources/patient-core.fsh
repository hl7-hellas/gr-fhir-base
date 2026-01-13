Invariant: gr-pat-core-id-amka
Description: "AMKA is 11 digits identifier"
Severity: #error
// @TODO: Find other way to constraint AMKA, the extension http://hl7.org/fhir/StructureDefinition/regex|5.2.0 is deprecated
Expression: "value.matches('[0-9]{11}')"
////////////////////////////////////////////////////////////////////////////////////////////////////
Invariant: gr-pat-core-name
Description: "given and family, or text, or a data-absent-reason extension SHALL be present"
Severity: #error
Expression: "(family.exists() and given.exists()) or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Invariant: gr-pat-core-address
Description: "line, city and postalCode, or a data-absent-reason extension SHALL be present"
Severity: #error
Expression: "(line.exists() and city.exists() and postalCode.exists()) or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Greek_Patient
Parent: Patient_Base
Id: greek-patient
Title: "Patient profile: Greek core requirements"
Description: """
Greek core requirements for Patient profile.

The patient record shall be compliant with EU and Greek core requirements, and records/provides:
"""

* ^experimental = false
* insert fmm-and-status(0, draft)

// Resource:
// id, meta, implicitRules, language

// DomainResource:
* text 1..1 MS
* text ^short = "Human interpretable summary of the resource SHALL be provided"
// contained
* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEuCore)
// modifierExtension

// Patient resource:
* identifier ^short = "Patient identifiers used in healthcare processes providing accurate patient and patient record identity. Patient identifiers SHALL contain at least an AMKA identifier"
* identifier
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "system"
  * ^slicing.rules = #open
* identifier contains amka 1..1 MS
* identifier[amka] ^short = "AMKA is required identifier"
* identifier[amka] obeys gr-pat-core-id-amka
* identifier[amka].use 1..1 MS
* identifier[amka].use ^short = "AMKA is an official identity"
* identifier[amka].use = #official
* identifier[amka].type 1..1 MS
* identifier[amka].type ^short = "AMKA is a national insurance number"
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#NIIP "National Insurance Payor Identifier (Payor)"
* identifier[amka].system 1..1 MS
* identifier[amka].system ^short = "AMKA is issued by Υπουργείο Εργασίας και Κοινωνικής Ασφάλισης"
* identifier[amka].system = $AMKA-SYS
* identifier[amka].value 1..1 MS
* identifier[amka].value ^short = "11 digits identifier"
* name 1..* MS
* name ^short = "Name of a patient containing parts of the full name. Given (first) name and family name (surname) parts SHALL be recorded/provided without abbreviation or as initials"
* name obeys gr-pat-core-name
* name.extension contains DataAbsentReason named dataAbsentReason 0..1 // http://hl7.org/fhir/StructureDefinition/data-absent-reason
* name.extension[dataAbsentReason] ^short = "Reason for missing patient's name. If patient's name is missing, the reason for missing SHALL be recorded/provided"
//telecom inherited from Base
* address 1..* MS
* address ^short = "Address of a patient SHALL provide either street name and house number, city, and postal code parts, or text be presented/displayed to human reader"
* address obeys gr-pat-core-address
* address.extension contains DataAbsentReason named dataAbsentReason 0..1 // http://hl7.org/fhir/StructureDefinition/data-absent-reason
* address.extension[dataAbsentReason] ^short = "Reason for missing patient's address. If patient's address is missing, the reason for missing SHALL be recorded/provided"
// multipleBirth[x] inherited from Base
// photo
// contact
// communication
// generalPractitioner
// managingOrganization
// link
