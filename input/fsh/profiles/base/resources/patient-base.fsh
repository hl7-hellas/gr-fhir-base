Invariant: amka-identifier
Description: "AMKA is 11 digits identifier"
Severity: #error
// TODO: Find other way to constraint AMKA, the extension http://hl7.org/fhir/StructureDefinition/regex|5.2.0 is deprecated
Expression: "value.matches('[0-9]{11}')"
////////////////////////////////////////////////////////////////////////////////////////////////////
Profile: Patient_Base
Parent: Patient
Id: patient-base
Title: "Patient profile: Greek base recommendations"
Description: """
Greek base recommendations for Patient profile.

The patient profile shall be compliant with EU and Greek base recommendations, and record/provide:

- place of birth (via extension)
- identifier
- full name and father's and mother's names (via extensions)
- gender
- birthdate (and time, via extension)
- address: _to be discussed_
- multiple births indicator, indicating which one in order was patient (indicating that patient has tween sibling(s)) and how many has been born
- language of communication
- patient's personal doctor: _to be discussed_
- patient's record managing organization: _to be discussed_
"""

* ^experimental = false
* insert fmm-and-status(0, draft)

* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEu)

// PatBirthPlace http://hl7.org/fhir/StructureDefinition/patient-birthPlace
* extension contains PatBirthPlace named birthPlace 0..1
* extension[birthPlace] ^short = "The place of birth of the patient"
* extension[birthPlace] ^definition = "Birth address is of Address datatype"
* extension[birthPlace] ^requirements = "Patient's birth address SHOULD be recorded/provided and it SHOULD contain at least city and postal code if known. If the information is not available as structured elements, the 'text' element could be used."

* identifier ^short = "Patient identifiers"
* identifier ^definition = "Patient identifiers used in healthcare processes providing accurate patient and patient record identity"
* identifier ^requirements = "Patient identifiers SHOULD contain at least an AMKA identifier"

* name ^short = "Patient name(s)"
* name ^definition = "Name of a patient containing parts of the full name"
* name ^requirements = "Surname and family name parts SHOULD be recorded/provided without abbreviation or as initials"
* name.text 0..1
* name.text ^short = "Patient's full name"
* name.text ^definition = "Patient's full name containing father's name"
* name.text ^requirements = "The full name as it SHOULD be presented/displayed to human reader. This SHOULD be provided"
// FathersFamily http://hl7.org/fhir/StructureDefinition/humanname-fathers-family
* name.family.extension contains FathersFamily named fatherName 0..1
* name.family.extension[fatherName] ^short = "Patient's father name"
* name.family.extension[fatherName] ^definition = "Patient's name in Greece usually contains fathers name"
* name.family.extension[fatherName] ^requirements = "Patient's father name SHOULD be recorded/provided if known"
// MothersFamily http://hl7.org/fhir/StructureDefinition/humanname-mothers-family
* name.family.extension contains MothersFamily named motherName 0..1
* name.family.extension[motherName] ^short = "Patient's mother name"
* name.family.extension[motherName] ^definition = "Patient's name may contain mother name"
* name.family.extension[motherName] ^requirements = "Patient's mother name SHOULD be recorded/provided if known"

* gender ^short = "Patient gender"
* gender ^definition = "Patient gender for administration and record keeping purposes: https://hl7.org/fhir/patient.html#gender"
* gender ^requirements = "Patient's gender SHOULD be recorded/provided"

// PatBirthTime https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-patient-birthTime.html
* birthDate.extension contains PatBirthTime named birthTime 0..1
* birthDate.extension[birthTime] ^short = "Patient's birth time information SHOULD be populated if known"
* birthDate.extension[birthTime] ^definition = "Patient's birth time (required in Neonatology) to complement birthDate providing precision"
* birthDate.extension[birthTime] ^requirements = "Patient's birth time information SHOULD be recorded/provided if known"

* address ^short = "TBD"

* multipleBirth[x] ^short = "Patient was born with siblings"
* multipleBirth[x] ^definition = "If patient was part of a multiple birth this information SHOULD be recorded/provided"
* multipleBirth[x] ^requirements = "The value used SHOULD be boolean for negative or an integer for positive, representing order of birth: 1 for the 1st born, 2 for the 2nd born, etc."

// PatMultipleBirthTotal http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal
* multipleBirth[x].extension contains PatMultipleBirthTotal named multiBirthTotal 0..1
* multipleBirth[x].extension[multiBirthTotal] ^short = "Number of patient's siblings at multiple birth time"
* multipleBirth[x].extension[multiBirthTotal] ^definition = "In case of multipleBirth this SHOULD be populated if known"
* multipleBirth[x].extension[multiBirthTotal] ^requirements = "If multipleBirth records/provides an integer, this SHOULD be populated"

* contact ^short = "TBD"

* communication.language ^short = "Language used (spoken/understood) by patient"
* communication.language ^definition = "Language appropriate for communication with patient because the patient is using it."
* communication.language ^requirements = "Patient communication language SHOULD be recorded/provided if it is not Greek language"

* generalPractitioner ^short = "TBD"
* managingOrganization ^short = "TBD"
