Instance: Patient-With-Amka
InstanceOf: Patient_Base
Title: "Patient record example, with AMKA"
Description: "An example of Patient record with AMKA, Greek base recommendations"
Usage: #example
* id = "Patient-With-Amka"
* meta.profile[0] = Canonical(Patient_Base)
* meta.profile[+] = Canonical(PatientEu)
* extension[birthPlace].valueAddress.city = "Αθήνα"
* extension[birthPlace].valueAddress.postalCode = "105 51"
* identifier.use = #official
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#NIIP "National Insurance Payor Identifier (Payor)"
* identifier.system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.2"
* identifier.value = "60121599819"
* name.text = "Γεώργιος (Ὀρφεύς) Παπαδόπουλος"
* name.family = "Παπαδόπουλος"
* name.given = "Γεώργιος"
* name.family.extension[fatherName].valueString = "Ὀρφεύς"
* name.family.extension[motherName].valueString = "Εὐρυδίκη"
* gender = #male
* birthDate = "1960-12-15"
* birthDate.extension[birthTime].url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
* birthDate.extension[birthTime].valueDateTime = "1960-12-15T16:45:00+02:00"
* multipleBirthInteger = 1
* multipleBirthInteger.extension[multiBirthTotal].url = "http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal"
* multipleBirthInteger.extension[multiBirthTotal].valuePositiveInt = 2
* communication.language = urn:ietf:bcp:47#el-GR
* communication.language.text = "Greek (Greece)"
