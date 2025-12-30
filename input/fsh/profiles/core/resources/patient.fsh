Invariant: gr-pat-name
Description: "given and family, or text, or a data-absent-reason extension SHALL be present"
Severity: #error
Expression: "(family.exists() and given.exists()) or text.exists() or extension('http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Greek_Patient
Parent: Patient_Base
Id: greek-patient
Title: "Patient: Greek core requirements"
Description: "Greek core requirements for Patient resource"
* ^experimental = false
* insert fmm-and-status(0, draft)

* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEuCore)

// http://hl7.org/fhir/StructureDefinition/patient-birthPlace
* extension[birthPlace] 1..1 MS
* extension[birthPlace] ^short = "The place of birth of the patient"
* extension[birthPlace] ^definition = "Birth address is of Address datatype"
* extension[birthPlace] ^requirements = "Patient's birth address SHALL be recorded/provided and it SHALL contain at least city and postal code if known. If the information is not available as structured elements, the 'text' element could be used."

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
* identifier[amka] obeys amka-identifier
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
* name ^short = "Patient name(s)"
* name ^definition = "Name of a patient containing parts of the full name"
* name ^requirements = "Given (first) name and family name (surname) parts SHALL be recorded/provided without abbreviation or as initials"
* name obeys gr-pat-name
* name.text 0..1 MS
* name.text ^short = "Patient's full name"
* name.text ^definition = "Patient's full name containing father's name"
* name.text ^requirements = "The full name as it SHALL be presented/displayed to human reader. This SHALL be provided"
* name.given 0..* MS
* name.given ^short = "Patient's given name"
* name.given ^definition = "Patient's given (first) name"
* name.given ^requirements = "Patient's given (first) name without abbreviation or as initials"
* name.family 0..1 MS
* name.family ^short = "Patient's family name"
* name.family ^definition = "Patient's family name (surname)"
* name.family ^requirements = "Patient's family name without abbreviation or as initials"
* name.family.extension[fatherName] 0..1 MS
* name.family.extension[fatherName] ^short = "Patient's father name"
* name.family.extension[fatherName] ^definition = "Patient's name in Greece usually contains fathers name"
* name.family.extension[fatherName] ^requirements = "Patient's father name SHALL be recorded/provided"
// DataAbsentReason http://hl7.org/fhir/StructureDefinition/data-absent-reason
* name.extension contains DataAbsentReason named dataAbsentReason 0..1
* name.extension[dataAbsentReason] ^short = "Reason for missing Patient's name"
* name.extension[dataAbsentReason] ^definition = "Reason for missing Patient's name"
* name.extension[dataAbsentReason] ^requirements = "If patient's name is missing, the reason for missing SHOULD be recorded/provided"

* gender 1..1
* gender ^short = "Patient gender"
* gender ^definition = "Patient gender for administration and record keeping purposes: https://hl7.org/fhir/patient.html#gender"
* gender ^requirements = "Patient's gender SHALL be recorded/provided"

* address ^short = "TBD"
* maritalStatus ^short = "TBD"

* multipleBirth[x] 0..1 MS
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Patient was born with siblings"
* multipleBirth[x] ^definition = "If patient was part of a multiple birth this information SHALL be recorded/provided"
* multipleBirth[x] ^requirements = "The value used SHALL be boolean for negative or an integer for positive, representing order of birth: 1 for the 1st born, 2 for the 2nd born, etc."

* multipleBirthInteger.extension[multiBirthTotal] 0..1 MS

* contact ^short = "TBD"

* communication.language 1..1 MS
* communication.language ^short = "Language used (spoken/understood) by patient"
* communication.language ^definition = "Language appropriate for communication with patient because the patient is using it."
* communication.language ^requirements = "Patient communication language SHALL be recorded/provided if it is not Greek language"

* generalPractitioner ^short = "TBD"
* managingOrganization ^short = "TBD"
