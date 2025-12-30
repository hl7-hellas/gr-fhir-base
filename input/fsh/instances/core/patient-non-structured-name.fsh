Instance: No-Structured-Name-Patient
InstanceOf: Greek_Patient
Title: "Patient example: Greek core"
Description: "Patient example, Greek requirements"
Usage: #example
* id = "No-Structured-Name-Patient"
* meta.profile[0] = Canonical(Greek_Patient)
* meta.profile[+] = Canonical(PatientEuCore)
* extension[birthPlace].valueAddress.city = "Αθήνα"
* extension[birthPlace].valueAddress.postalCode = "105 51"
* identifier[amka].use = #official
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#NIIP "National Insurance Payor Identifier (Payor)"
* identifier[amka].system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.2"
* identifier[amka].value = "60121599819"
* name.text = "Γεώργιος (Ὀρφεύς) Παπαδόπουλος"
* gender = #male
* birthDate = "1960-12-15"
* birthDate.extension[birthTime].url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
* birthDate.extension[birthTime].valueDateTime = "1960-12-15T16:45:00+02:00"
//* address ^short = "TBD"
//* maritalStatus ^short = "TBD"
* multipleBirthInteger = 1
* multipleBirthInteger.extension[multiBirthTotal].url = "http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal"
* multipleBirthInteger.extension[multiBirthTotal].valuePositiveInt = 2
//* contact ^short = "TBD"
* communication.language = urn:ietf:bcp:47#el-GR
* communication.language.text = "Greek (Greece)"
//* generalPractitioner ^short = "TBD"
//* managingOrganization ^short = "TBD"
