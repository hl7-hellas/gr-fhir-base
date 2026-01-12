Invariant: shall-be-omitted
Description: "SHALL be omitted as it is forbidden or not needed."
Expression: "$this.exists().not()"
Severity: #error
////////////////////////////////////////////////////////////////////////////////////////////////////
Invariant: should-be-omitted
Description: "SHOULD be omitted to avoid data clutter."
Expression: "$this.exists().not()"
Severity: #warning
////////////////////////////////////////////////////////////////////////////////////////////////////
RuleSet: should-not-be-populated(path)
* {path} obeys should-be-omitted
* {path} ^short = "'{path}' should not be populated"
* {path} ^definition = "For data minimization reasons, '{path}' SHOULD NOT be populated for this profile."
* {path} ^comment = "Omission of '{path}' may fail FHIR validation. Such errors may be ignored."
////////////////////////////////////////////////////////////////////////////////////////////////////
RuleSet: shall-not-be-populated(path)
* {path} obeys shall-be-omitted
* {path} 0..0
* {path} ^short = "'{path}' shall not be populated"
* {path} ^definition = "'{path}' SHALL NOT be populated for this profile."
////////////////////////////////////////////////////////////////////////////////////////////////////
RuleSet: fmm-and-status(fmm, status)
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = {fmm}
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #{status}
