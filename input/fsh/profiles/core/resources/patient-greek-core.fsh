Profile: Core_Greek_Patient
Parent: Base_Greek_Patient
Id: core-greek-patient
Title: "Patient: Greek core requirements"
Description: "Greek core requirements for Patient resource"
* ^experimental = false
* insert fmm-and-status(0, draft)

* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEuCore)

// http://hl7.org/fhir/StructureDefinition/patient-birthPlace
* extension[birthAddress] 1..1 MS
* extension[birthAddress] ^short = "The place of birth of the patient"
* extension[birthAddress] ^definition = "Birth address is of Address datatype"
* extension[birthAddress] ^requirements = "Patient's birth address SHALL be recorded/provided and it should contain at least city and postal code if known. If the information is not available as structured elements, the 'text' element could be used."

* name 2..* MS
* name ^short = "Patient name(s)"
* name ^definition = "Name of a patient containing parts of the full name"
* name ^requirements = "Surname and family name parts SHALL be recorded/provided without abbreviation or as initials"

* name.family.extension[fatherName] 0..1 MS
* name.family.extension[fatherName] ^short = "Patient's father name"
* name.family.extension[fatherName] ^definition = "Patient's name in Greece usually contains fathers name"
* name.family.extension[fatherName] ^requirements = "Patient's father name SHALL be recorded/provided if known"

* name.extension[latinized] 1..1 MS
* name.extension[latinized] ^short = "Patient's name transliterated to latin script"
* name.extension[latinized] ^definition = "Patient's name represented using standard alphabetic letters"
* name.extension[latinized] ^requirements = "Patient's name SHALL provide alphabetical form"
* name.extension[latinized].value[x] = #ABC

* gender 1..1
* gender ^short = "Patient gender"
* gender ^definition = "Patient gender for administration and record keeping purposes: https://hl7.org/fhir/patient.html#gender"
* gender ^requirements = "Patient's gender SHALL be recorded/provided"

* address ^short = "TBD"
* maritalStatus ^short = "TBD"

* multipleBirth[x] 0..1 MS
* multipleBirth[x] only integer
* multipleBirth[x] ^short = "Patient was born with siblings"
* multipleBirth[x] ^definition = "If patient was part of a multiple birth this information should be recorded/provided"
* multipleBirth[x] ^requirements = "The value used SHALL be boolean for negative or an integer for positive, representing order of birth: 1 for the 1st born, 2 for the 2nd born, etc."

* multipleBirthInteger.extension[multiBirthTotal] 0..1 MS

* contact ^short = "TBD"

* communication.language 1..1 MS
* communication.language ^short = "Language used (spoken/understood) by patient"
* communication.language ^definition = "Language appropriate for communication with patient because the patient is using it."
* communication.language ^requirements = "Patient communication language SHALL be recorded/provided if it is not Greek language"

* generalPractitioner ^short = "TBD"
* managingOrganization ^short = "TBD"
