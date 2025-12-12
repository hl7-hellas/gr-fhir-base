Invariant: gr-amka-identifier
Description: "AMKA is 11 digits identifier"
Severity: #error
// TODO: Find other way to constraint AMKA, the extension http://hl7.org/fhir/StructureDefinition/regex|5.2.0 is deprecated
Expression: "value.matches('[0-9]{11}')"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Base_Greek_Patient
Parent: Patient
Id: base-greek-patient
Title: "Patient: Greek base recommendations"
Description: "Greek base recommendations for Patient resource"
* ^experimental = false
* insert fmm-and-status(0, draft)

* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEu)

// http://hl7.org/fhir/StructureDefinition/patient-birthPlace
* extension contains PatBirthPlace named birthAddress 0..1
* extension[birthAddress] ^short = "The place of birth of the patient"
* extension[birthAddress] ^definition = "Birth address is of Address datatype"
* extension[birthAddress] ^requirements = "Patient's birth address should be recorded/provided and it should contain at least city and postal code if known. If the information is not available as structured elements, the 'text' element could be used."

* identifier 1..* MS
* identifier ^short = "Patient identifiers"
* identifier ^definition = "Patient identifiers used in healthcare processes providing accurate patient and patient record identity"
* identifier ^requirements = "Patient identifiers SHALL contain at least an AMKA identifier"
* identifier
  * ^slicing.discriminator[0].type = #value
  * ^slicing.discriminator[=].path = "type"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "system"
  * ^slicing.rules = #open
* identifier contains amka 1..1 MS
* identifier[amka] ^short = "AMKA is required identifier"
* identifier[amka] obeys gr-amka-identifier
* identifier[amka].use 1..1 MS
* identifier[amka].use ^short = "AMKA is an official identity"
* identifier[amka].use = #official
* identifier[amka].type 1..1 MS
* identifier[amka].type ^short = "AMKA is a social security number"
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#SS "Social Security number"
* identifier[amka].system 1..1 MS
* identifier[amka].system ^short = "AMKA is issued by Υπουργείο Εργασίας και Κοινωνικής Ασφάλισης"
* identifier[amka].system = $AMKA-SYS
* identifier[amka].value 1..1 MS
* identifier[amka].value ^short = "11 digits identifier"

* name ^short = "Patient name(s)"
* name ^definition = "Name of a patient containing parts of the full name"
* name ^requirements = "Surname and family name parts should be recorded/provided without abbreviation or as initials"

// FathersFamily http://hl7.org/fhir/StructureDefinition/humanname-fathers-family
* name.family.extension contains FathersFamily named fatherName 0..1
* name.family.extension[fatherName] ^short = "Patient's father name"
* name.family.extension[fatherName] ^definition = "Patient's name in Greece usually contains fathers name"
* name.family.extension[fatherName] ^requirements = "Patient's father name should be recorded/provided if known"

// MothersFamily http://hl7.org/fhir/StructureDefinition/humanname-mothers-family
* name.family.extension contains MothersFamily named motherName 0..1
* name.family.extension[motherName] ^short = "Patient's mother name"
* name.family.extension[motherName] ^definition = "Patient's name may contain mother name"
* name.family.extension[motherName] ^requirements = "Patient's mother name should be recorded/provided if known"

// http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation
* name.extension contains ENRepresentation named latinized 0..1
* name.extension[latinized] ^short = "Patient's name transliterated to latin script"
* name.extension[latinized] ^definition = "Patient's name represented using standard alphabetic letters"
* name.extension[latinized] ^requirements = "Patient's name should provide alphabetical form"
* name.extension[latinized].value[x] = #ABC

* gender ^short = "Patient gender"
* gender ^definition = "Patient gender for administration and record keeping purposes: https://hl7.org/fhir/patient.html#gender"
* gender ^requirements = "Patient's gender should be recorded/provided"

// https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-patient-birthTime.html
* birthDate.extension contains PatBirthTime named birthTime 0..1
* birthDate.extension[birthTime] ^short = "Patient's birth time information should be populated if known"
* birthDate.extension[birthTime] ^definition = "Patient's birth time (required in Neonatology) to complement birthDate providing precision"
* birthDate.extension[birthTime] ^requirements = "Patient's birth time information should be recorded/provided if known"

* address ^short = "TBD"
* maritalStatus ^short = "TBD"

* multipleBirth[x] ^short = "Patient was born with siblings"
* multipleBirth[x] ^definition = "If patient was part of a multiple birth this information should be recorded/provided"
* multipleBirth[x] ^requirements = "The value used should be boolean for negative or an integer for positive, representing order of birth: 1 for the 1st born, 2 for the 2nd born, etc."

// http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal
* multipleBirth[x].extension contains PatMultipleBirthTotal named multiBirthTotal 0..1
* multipleBirth[x].extension[multiBirthTotal] ^short = "Number of patient's siblings at multiple birth time"
* multipleBirth[x].extension[multiBirthTotal] ^definition = "In case of multipleBirth this should be populated if known"
* multipleBirth[x].extension[multiBirthTotal] ^requirements = "If multipleBirth records/provides an integer, this should be populated"

* contact ^short = "TBD"

* communication.language ^short = "Language used (spoken/understood) by patient"
* communication.language ^definition = "Language appropriate for communication with patient because the patient is using it."
* communication.language ^requirements = "Patient communication language should be recorded/provided if it is not Greek language"

* generalPractitioner ^short = "TBD"
* managingOrganization ^short = "TBD"
