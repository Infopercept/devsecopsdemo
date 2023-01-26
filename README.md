# 📙 Documentation

DevSecOps Lab Demo



Tools we are going to use:

Contineous Integration:

1. SonarQube

TODO: Need to complete list for demo.



Container Layers:

	Infrastructure
		Cluster configuration
		
	Build
	
		Container image scanning
		Software bill of materials and dependency
	
	Runtime
		Container access policy
		Resource utilization policy
		Network isolation policy
		Syscall, ownership mode
		
		
# Notes from Saumya

Code Scanning, Alerts, and Notification of Security Anomalies

Gitlab ~ For SDLC
Alerta ~ for Scanning and Code Check 
Shiftleft ~ Code Analysis
Trivy ~ Container Vulnerability Scanning
- GitLabCI
- Jenkins
- Github Actions
- CircleCI
Snyk ~ Find And Fix Vulns
Gerrit ~ Code Review
SonarSource 


Automation: Scanning, Discovery, and Remediation of Security Defects

StackStorm 
OWAPS Glue
Owasp Zap
Owasp Dependency Check
Lynis ~ For Health Check
Nuclie

Dashboards for Visibility: Customize Your View and Integrate Sources
Grafana
Kibana

Threat Intelligence: Identity, Predict, and Define Threats

OWASP Threat Dragon

Testing: Find Security Issues Before Going Live

Falco — Deployment runtime verification
BDD-Security
Arachni — Testing

Gsource ~ Github. 

## General resources

AWS: https://docs.aws.amazon.com/AmazonECS/latest/bestpracticesguide/security-runtime.html
DevSecOps Introduction Video: https://www.youtube.com/watch?v=42UP1fxi2SY


## Containser Scanning

1. Trivy: Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more
	URL - https://github.com/aquasecurity/trivy
2. Clair: Vulnerability Static Analysis for Containers
	URL: https://github.com/quay/clair
Vulnerable container source: https://vulnerablecontainers.org/

## Cluster configuration

1. Kube-bench: Checks whether Kubernetes is deployed according to security best practices as defined in the CIS Kubernetes Benchmark
	URL: https://github.com/aquasecurity/kube-bench

API Security:

1. Internal
2. Third party
3. Shadow
4. Partner
5. External
6. Orphand
7. Unknown

Tools:
https://www.metlo.com/
https://www.zaproxy.org/
https://github.com/flipkart-incubator/Astra
https://www.traceable.ai

Resource:
https://www.youtube.com/watch?v=iIKws2_0j34&t=242s
https://owasp.org/www-community/Free_for_Open_Source_Application_Security_Tools
