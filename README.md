# Keycloak's Test Evolution: Your Guide to Mastering the New Test Framework

This repository contains materials prepared for [KeyCloak DevDay 26](https://keycloak-day.dev/).

[Presentation (PDF)](./presentation.pdf)

[Test scenarios](./src/test/java/org/keycloak/devday/scenarios)

[Custom provider sources](./src/main/)

[Custom provider test](./src/test/java/org/keycloak/devday/extension/DevDayProviderTest.java) 

## Custom scripts

For the code demonstration I used two custom bash scripts: 
- [`prepare-presentation.sh`](./prepare-presentation.sh) 
- [`present.sh`](./present.sh)

It uses git to cherry-pick commits to a staging area from a main branch to a work branch. The IDE then clearly highlights
new and modified code.

Instead of manually looking for the files, the
[IDEA CLI](https://www.jetbrains.com/help/idea/working-with-the-ide-features-from-command-line.html) is used to open
them automatically, after the git operations.

Both scripts were created for this single purpose with hardcoded values. They were not made to be pretty, or versatile.
They were made to work.
