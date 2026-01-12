Logical: GreekPatient
Title: "Greek patient record logical model"
Description: """FHIR logical model of Greek patient record derived from the [Logical model](./logical-models.html#patient)"""
* identifier 1..* GreekIdentifier "An identifier of the patient that is unique within assigning authority. At least an ΑΜΚΑ (Αριθμός Μητρώου Κοινωνικής Ασφάλισης) for the Greek employment and insurance identification. Patient can have other identifiers"
* name 1..* GreekName "Patient's name(s) - Name may contain distinct parts and it should contain at least full name as an unstructured text"
* dateOfBirth 1..1 dateTime "The date of birth of the patient"
* gender 0..1 code "Patient's gender for administration and record keeping purposes"
  * ^binding.description = "FEMALE | MALE | UNKNOWN"
  * ^binding.strength = #example
* addresses 0..* GreekAddress "Patient's address(es) for administrative and contact purposes. Addresses may contain distinct parts (e.g., street address with house number, postal code, and city), and it should contain at least full address as an unstructured text"
* contacts 0..* GreekContact "Patient's communication contact points such are phone number or an email address"
