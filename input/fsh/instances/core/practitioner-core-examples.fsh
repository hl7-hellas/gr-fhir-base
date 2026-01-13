Instance: Ioannis-Papageorgiou
InstanceOf: Greek_Practitioner
Title: "Practitioner record example"
Description: "An example of practitioner record, Greek base recommendations"
Usage: #example
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Ιωάννης Παπαγεωργίου, male</h1><table><tr><td>Medical license</td><td>dr-123-4567</td></tr><tr><td>Specialities</td><td><ul><li>ΓΕΝΙΚΗ/ΟΙΚΟΓΕΝΕΙΑΚΗ ΙΑΤΡΙΚΗ</li><li>ΠΑΘΟΛΟΓΟΣ</li></ul></td></tr><tr><td>Address</td><td>Αλ. Συμεωνίδη 2, Θεσσαλονίκη 546 39</td></tr><tr><td>Contact</td><td><ul><li>ioannis.papageorgiou@mail.com</li><li>2313301848</li></ul></td></tr></table></div>"
* id = "Ioannis-Papageorgiou"
* meta.profile[0] = Canonical(Greek_Practitioner)
* meta.profile[+] = Canonical(PractitionerEuCore)
* identifier[medlic].use = #official
* identifier[medlic].type = http://terminology.hl7.org/CodeSystem/v2-0203#MD "Medical License number"
* identifier[medlic].system = "urn:oid:2.16.840.1.113883.2.25.3.4.1.1.3"
* identifier[medlic].value = "dr-123-4567"
* name.text = "Ιωάννης Παπαγεωργίου"
* name.family = "Παπαγεωργίου"
* name.given = "Ιωάννης"
* telecom[0].system = #email
* telecom[=].value = "ioannis.papageorgiou@mail.com"
* telecom[=].use = #work
* telecom[+].system = #phone
* telecom[=].value = "2313301848"
* telecom[=].use = #work
* gender = #male
* address.use = #work
* address.line = "Αλ. Συμεωνίδη 2"
* address.city = "Θεσσαλονίκη"
* address.postalCode = "546 39"
* address.country = #GR
* qualification[0].code = Practitioner_Specialty#4 "ΓΕΝΙΚΗ/ΟΙΚΟΓΕΝΕΙΑΚΗ ΙΑΤΡΙΚΗ"
* qualification[+].code = Practitioner_Specialty#14 "ΠΑΘΟΛΟΓΟΣ"
