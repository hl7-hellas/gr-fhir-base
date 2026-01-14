
### Validation

To validate resources against profiles use the [FHIR Validator](https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar) with the [IG package downloaded from the IG site (./package.tgz)](package.tgz):

```sh
# Get validator_cli.jar
curl -L -O https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar

# Get IG package
curl -L -O https://hl7-hellas.github.io/site/package.tgz

# Run to validate
java -jar path/to/validator_cli.jar \
-version 5.0.0 \
-ig path/to/package.tgz \
-profile https://hl7-hellas.gr/fhir/hl7-fhir-gr-base-and-core-r5/StructureDefinition/greek-patient \
path/to/patient.json

# (1) -jar - location of the validator_cli.jar on your computer (downloaded in step 1 above)
# (2) -version - the FHIR version. This IG relies on FHIR R5
# (3) -ig - location of the IG package on your computer (downloaded in step 2 above)
# (4) -profile - canonical url of a profile (the "Official URL" on any of the profile pages)
# (5) path/to/patient.json - location of the resource you wish to validate on your computer
```

This example command validates patient resource against the [Patient: Greek core requirements] profile.

More on quality and validation [below](#quality).

### IG development environment and build process

This implementation guide utilizes FSH ([FHIR Shorthand](https://hl7.org/fhir/uv/shorthand/)) and SUSHI (SUSHI Unshortens Short Hand Inputs) to build the IG, and IG Publisher and Validator to validate and publish the IG.

#### Tools

The development and build processes require a number of tools that need to be installed before start.

##### SUSHI

SUSHI is an open source JavaScript/TypeScript CLI (command line interface), an interpreter and compiler of the FSH.

SUSHI can be used standalone to produce FHIR artifacts from FSH files, or integrated with IG Publisher for automatic builds.

SUSHI depends on Node.js, so installing Node.js is a prerequisite.

Install Node.js from [download page](https://nodejs.org/en/download).

Install SUSHI 

```shell
$ npm install -g fsh-sushi
```

> SUSHI code can be found at [Github](https://github.com/FHIR/sushi).

> SUSHI documentation can be found at [FSH school](https://fshschool.org/docs/sushi/).

##### IG Publisher

IG Publisher is an open source Java tool which prepares, packages and publishes FHIR artifacts (the IG source) from the IG in human friendly format (the IG specification).

IG Publisher can be used also for validation.

IG Publisher depends on Java and Jekyll, so installing them is a prerequisite.

**Install Java**

The JRE (Java Runtime Environment) is sufficient, but JDK (Java Development Kit) can be used as well.
Numerous installation are available, here are two options:

- [Oracle licensed software](https://www.java.com/en/download/)
- [Adoptium open source](https://adoptium.net/temurin/releases/) (recommended)

**Install Jekyll**

Jekyll is open source Ruby tool for transforming inputs to static HTML web pages.

It depends on Ruby, so installing Ruby is a prerequisite.

1. Install Ruby from [Ruby site](https://www.ruby-lang.org/en/downloads/).
2. Install Jekyll and Bundler (for managing gem dependencies)

```shell
gem install jekyll bundler
```

**_Install_ IG Publisher**

Download the IG Publisher from [Github](https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar) and put it in `./input-cache` directory.

```shell
# Get publisher.jar
curl -L -O https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar -o ./input-cache/publisher.jar
```

IG Publisher can be downloaded to correct location also by running ["_updatePublisher" script](https://github.com/HL7/ig-publisher-scripts) executed in the root directory of this IG.

> IG Publisher code can be found at [Github](https://github.com/HL7/fhir-ig-publisher).

> IG Publisher documentation can be found at [HL7 Confluence](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation).

#### Building/publishing

After work on IG source has been done run the tool:

```shell
java -jar ./input-cache/publisher.jar -ig ig.ini
```

Depending on the size of the IG, publisher may need more resources:

```shell
java -Xms3550m -Xmx3550m -jar ./input-cache/publisher.jar -ig ig.ini
```

The result of build process are multiple directories: `fsh-generated`, `template`, `output`, `temp`, `translations`.

After build finishes the IG is locally browsable by opening `./output/index.html` in a browser.

The final result is _deployable_/_publishable_ archive containing static site: `./output/full-ig.zip`.

##### Quality

Each publisher's run performs validation of generated FHIR resources and produces page with quality report: `./output/qa.html`.

###### Manual validation of instances, examples, ...

Download FHIR Validator from [Github](https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar).

```shell
# Get validator_cli.jar
curl -L -O https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar
```

> Validator code can be found at [Github](https://github.com/hapifhir/org.hl7.fhir.core/tree/master/org.hl7.fhir.validation.cli)

> Validator documentation can be found at [HL7 Confluence](https://confluence.hl7.org/spaces/FHIR/pages/35718580/Using+the+FHIR+Validator).


Validate the instance/example against a FHIR R5 profile and locally built IG:

```shell
java -jar validator_cli.jar [instance/example file path] -version 5.0.0 -ig output -profile https://hl7-hellas.gr/fhir/hl7-fhir-gr-base-and-core-r5/StructureDefinition/greek-patient
```

Validate the instance/example against a FHIR R5 profile (e.g. hl7.fhir.gr.base-and-core-r5) and published IG:

```shell
java -jar validator_cli.jar [instance/example file path] -version 5.0.0 -ig hl7.fhir.gr.base-and-core-r5#current -profile https://hl7-hellas.gr/fhir/hl7-fhir-gr-base-and-core-r5/StructureDefinition/greek-patient
```

For unpublished IG, you need to download IG package:

```shell
# Get IG package
curl -L -O https://hl7-hellas.github.io/site/package.tgz
```

and utilize it locally:

```shell
java -jar validator_cli.jar [instance/example file path] -version 5.0.0 -ig package.tgz -profile https://hl7-hellas.gr/fhir/hl7-fhir-gr-base-and-core-r5/StructureDefinition/greek-patient
```

### Dependencies

{% include dependency-table.xhtml %}

### Cross Version Analysis

{% include cross-version-analysis.xhtml %}

### Global Profiles

{% include globals-table.xhtml %}

### Intellectual Property Statements

{% include ip-statements.xhtml %}

### Global Profiles Statements

{% include globals-table.xhtml %}

### Credits

* HL7 Hellas, [contact](mailto:info@hl7-hellas.gr)

Contributors are welcome! Please contact us if you are interested in helping to support this work.
