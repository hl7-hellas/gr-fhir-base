Instance: Base-Example-PatientWithAmka
InstanceOf: Base_Greek_Patient
Title: "Patient example: Greek base with AMKA"
Description: "Patient example with AMKA, Greek recommendation"
Usage: #example
* id = "Base-Example-Patient"
* meta.profile[0] = Canonical(Base_Greek_Patient)
* meta.profile[+] = Canonical(PatientEu)
* identifier[amka].use = #official
* identifier[amka].type = http://terminology.hl7.org/CodeSystem/v2-0203#SS "Social Security number"
* identifier[amka].system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.2"
* identifier[amka].value = "01018022432"
