Instance: Core-Example-Patient
InstanceOf: Core_Greek_Patient
Title: "Patient example: Greek core"
Description: "Patient example, Greek requirements"
Usage: #example
* id = "Core-Example-Patient"
* meta.profile[0] = Canonical(Core_Greek_Patient)
* meta.profile[+] = Canonical(PatientEuCore)
* extension[birthAddress].valueAddress.city = "Αθήνα"
* extension[birthAddress].valueAddress.postalCode = "105 51"
* identifier[amka].use = #official
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#SS "Social Security number"
* identifier[amka].system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.2"
* identifier[amka].value = "01018022432"
* name[0].family = "Παπαδόπουλος"
* name[=].given = "Γεώργιος"
//* name[=].family.extension[fatherName].url = "http://hl7.org/fhir/StructureDefinition/humanname-fathers-family"
* name[=].family.extension[fatherName].valueString = "Ὀρφεύς"
//* name[=].family.extension[motherName].url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* name[=].family.extension[motherName].valueString = "Εὐρυδίκη"
* name[+].family = "Papadópoulos"
* name[=].given = "Geórgios"
* name[=].extension[latinized].url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name[=].extension[latinized].valueCode = #ABC
* gender = #male
* birthDate = "1961-02-28"
* birthDate.extension[birthTime].url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
* birthDate.extension[birthTime].valueDateTime = "1961-02-28T16:12:00+02:00"
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
