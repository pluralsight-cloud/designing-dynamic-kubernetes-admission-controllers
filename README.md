# Designing Dynamic Kubernetes Admission Controllers

Welcome to the GitHub repo for the PluralSight Cloud course **Designing Dynamic Kubernetes Admission Controllers**. This repo contains:

- **Example Webhooks**
  1. `image-checker-webhook`: Validating webhook example
  2. `label-add-webhook`: Mutating webhook example
  3. `lab-example`: `label-add-webhook` with pre-configured certs and Docker Hub-provided image reference
  4. `lab-example_v2`: Lightly refactored `label-add-webhook` where user can set labels within deployment
- **READMEs**: Additional reference files for configuring environments and using code

None of this code is intended for production use. These examples are made to highlight REQUEST and RESPONSE objects for the Kubernetes admission review API and are for educational use.
