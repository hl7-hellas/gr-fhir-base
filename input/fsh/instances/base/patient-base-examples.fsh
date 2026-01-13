Instance: With-Amka
InstanceOf: Patient_Base
Title: "Patient record example, with AMKA"
Description: "An example of Patient record with AMKA, Greek base recommendations"
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Γεώργιος (Ὀρφεύς) Παπαδόπουλος, male</h1><table><tr><td>AMKA</td><td>60121599819</td></tr><tr><td>Born</td><td>1960-12-15 @ 16:45 in Αθήνα, 105 51</td></tr><tr><td>Address</td><td>Αλ. Συμεωνίδη 2, Θεσσαλονίκη 546 39</td></tr><tr><td>Additional</td><td>1st born out of 2 multiple births</td></tr></table></div>"
* id = "With-Amka"
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
* address.text = "Αλ. Συμεωνίδη 2, Θεσσαλονίκη 546 39"
* birthDate = "1960-12-15"
* birthDate.extension[birthTime].url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
* birthDate.extension[birthTime].valueDateTime = "1960-12-15T16:45:00+02:00"
* multipleBirthInteger = 1
* multipleBirthInteger.extension[multiBirthTotal].url = "http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal"
* multipleBirthInteger.extension[multiBirthTotal].valuePositiveInt = 2
