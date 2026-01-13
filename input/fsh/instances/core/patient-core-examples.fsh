Instance: George-Papadopoulos
InstanceOf: Greek_Patient
Title: "Patient record example"
Description: "An example of patient record, Greek core requirements"
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Γεώργιος (Ὀρφεύς) Παπαδόπουλος, male</h1><table><tr><td>AMKA</td><td>60121599819</td></tr><tr><td>Born</td><td>1960-12-15 @ 16:45 in Αθήνα, 105 51</td></tr><tr><td>Address</td><td>Αλ. Συμεωνίδη 2, Θεσσαλονίκη 546 39</td></tr><tr><td>Additional</td><td>1st born out of 2 multiple births</td></tr></table></div>"
* id = "George-Papadopoulos"
* meta.profile[0] = Canonical(Greek_Patient)
* meta.profile[+] = Canonical(PatientEuCore)
* extension[birthPlace].valueAddress.city = "Αθήνα"
* extension[birthPlace].valueAddress.postalCode = "105 51"
* identifier[amka].use = #official
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#NIIP "National Insurance Payor Identifier (Payor)"
* identifier[amka].system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.2"
* identifier[amka].value = "60121599819"
* name.text = "Γεώργιος (Ὀρφεύς) Παπαδόπουλος"
* name.family = "Παπαδόπουλος"
* name.given = "Γεώργιος"
* name.family.extension[fatherName].valueString = "Ὀρφεύς"
* name.family.extension[motherName].valueString = "Εὐρυδίκη"
* gender = #male
* address.use = #home
* address.line = "Αλ. Συμεωνίδη 2"
* address.city = "Θεσσαλονίκη"
* address.postalCode = "546 39"
* address.country = #GR
* birthDate = "1960-12-15"
* birthDate.extension[birthTime].url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
* birthDate.extension[birthTime].valueDateTime = "1960-12-15T16:45:00+02:00"
* multipleBirthInteger = 1
* multipleBirthInteger.extension[multiBirthTotal].url = "http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal"
* multipleBirthInteger.extension[multiBirthTotal].valuePositiveInt = 2
////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: No-Name-No-Address
InstanceOf: Greek_Patient
Title: "Patient record example, missing name"
Description: "An example of patient record with missing name, Greek core requirements"
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Temporarily Unknown, male</h1><table><tr><td>AMKA</td><td>60121599819</td></tr><tr><td>Born</td><td>1960-12-15</td></tr><tr><td>Address</td><td>Temporarily Unknown</td><td>Additional</td><td>/</td></tr></table></div>"
* id = "No-Name-No-Address"
* meta.profile[0] = Canonical(Greek_Patient)
* meta.profile[+] = Canonical(PatientEuCore)
* identifier[amka].use = #official
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#NIIP "National Insurance Payor Identifier (Payor)"
* identifier[amka].system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.2"
* identifier[amka].value = "60121599819"
* name.text = "Name is unknown"
* name.extension[dataAbsentReason].url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* name.extension[dataAbsentReason].valueCode = #temp-unknown "Temporarily Unknown"
* gender = #male
* address.text = "Address is unknown"
* address.extension[dataAbsentReason].url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* address.extension[dataAbsentReason].valueCode = #temp-unknown "Temporarily Unknown"
* birthDate = "1960-12-15"
////////////////////////////////////////////////////////////////////////////////////////////////////
Instance: No-Structured-Name
InstanceOf: Greek_Patient
Title: "Patient record example, unstructured name"
Description: "An example of patient record with unstructured name, Greek core requirements"
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Γεώργιος (Ὀρφεύς) Παπαδόπουλος, male</h1><table><tr><td>AMKA</td><td>60121599819</td></tr><tr><td>Born</td><td>1960-12-15 @ 16:45 in Αθήνα, 105 51</td></tr><tr><td>Address</td><td>Αλ. Συμεωνίδη 2, Θεσσαλονίκη 546 39</td></tr><tr><td>Additional</td><td>1st born (in Αθήνα, 105 51) out of 2 multiple births</td></tr></table></div>"
* id = "No-Structured-Name"
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
* address.use = #home
* address.line = "Αλ. Συμεωνίδη 2"
* address.city = "Θεσσαλονίκη"
* address.postalCode = "546 39"
* address.country = #GR
* birthDate = "1960-12-15"
* birthDate.extension[birthTime].url = "http://hl7.org/fhir/StructureDefinition/patient-birthTime"
* birthDate.extension[birthTime].valueDateTime = "1960-12-15T16:45:00+02:00"
* multipleBirthInteger = 1
* multipleBirthInteger.extension[multiBirthTotal].url = "http://hl7.org/fhir/StructureDefinition/patient-multipleBirthTotal"
* multipleBirthInteger.extension[multiBirthTotal].valuePositiveInt = 2
