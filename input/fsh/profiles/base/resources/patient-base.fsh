Invariant: amka-identifier
Description: "AMKA is 11 digits identifier"
Severity: #error
// @TODO: Find other way to constraint AMKA, the extension http://hl7.org/fhir/StructureDefinition/regex|5.2.0 is deprecated
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
- address
- multiple births indicator, indicating which one in order was patient (indicating that patient has tween sibling(s)) and how many has been born

___to be discussed:___

- deceased status/flag
- patient's personal doctor
- patient's record managing organization
"""

* ^experimental = false
* insert fmm-and-status(0, draft)

* insert should-not-be-populated(implicitRules)
* insert should-not-be-populated(language)

* text 0..1
* text ^short = "Human interpretable summary of the resource SHOULD be provided"
* insert should-not-be-populated(contained)
* ^extension[SDImposeProfile][0].valueCanonical = Canonical(PatientEu)
// PatBirthPlace http://hl7.org/fhir/StructureDefinition/patient-birthPlace
* extension contains PatBirthPlace named birthPlace 0..1
* extension[birthPlace] ^short = "The place of birth of the patient SHOULD be recorded/provided and it SHOULD contain at least city and postal code if known. If the information is not available as structured elements, the 'text' element could be used."
* insert should-not-be-populated(modifierExtension)
* identifier 1..*
* identifier ^short = "Patient identifiers used in healthcare processes providing accurate patient and patient record identity. Patient identifiers SHALL contain at least an AMKA identifier"
* insert should-not-be-populated(active)
* name 1..*
* name ^short = "Name of a patient containing parts of the full name. Surname and family name parts SHOULD be recorded/provided without abbreviation or as initials"
* name only HumanName_Base
* telecom 0..*
* telecom ^short  = "Patient's contact information"
* telecom.system 0..1
* telecom.value 1..1
* telecom.use 0..1
* insert should-not-be-populated(telecom.rank)
* insert should-not-be-populated(telecom.period)
* gender 1..1
* gender ^short = "Patient gender for administration and record keeping purposes SHALL be recorded/provided"
* birthDate 1..1
* birthDate ^short  = "Patient's date of birth SHALL be recorded/provided"
// PatBirthTime https://build.fhir.org/ig/HL7/fhir-extensions/StructureDefinition-patient-birthTime.html
* birthDate.extension contains PatBirthTime named birthTime 0..1
* birthDate.extension[birthTime] ^short = "Patient's birth time, (required in Neonatology) to complement birthDate providing precision, SHOULD be recorded/provided if known"
* insert should-not-be-populated(deceased[x])

* address ^short = "TBD"

* insert should-not-be-populated(maritalStatus)
* multipleBirth[x] ^short = "Patient was born with siblings. The value SHOULD be recorder and it SHOULD use boolean for negative or an integer for positive, representing order of birth: 1 for the 1st born, 2 for the 2nd born, etc."
// PatMultipleBirthTotal http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal
* multipleBirth[x].extension contains PatMultipleBirthTotal named multiBirthTotal 0..1
* multipleBirth[x].extension[multiBirthTotal] ^short = "Number of patient's siblings at multiple birth time. If multipleBirth records/provides an integer, this SHOULD be populated"
* insert should-not-be-populated(photo)
* insert should-not-be-populated(contact)
* insert should-not-be-populated(communication)
* insert should-not-be-populated(generalPractitioner)
* insert should-not-be-populated(managingOrganization)
* insert should-not-be-populated(link)
