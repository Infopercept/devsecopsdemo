# 📙 k8s best practises

k8s should be practised based on parameters as below:
- Ease of deployment and maintenance
- Security
- Vulnaribility Patching
- Flexibility

## Container Security
The top container security concerns are:
- Image security
- Host security
- Vulnaribility Management
- Container Isolation

Image Security
- Where did an image come from?
- Is it an official image?
- Is it the right version?
- Has somebody modified it

Host Security
- Is my host exposted to attack surface?
- How to manage host security horizontally?

Container Vulnerability Management
- What is my patch policy?
- Smaller Image, Less Vulnerabilities
- How can I automate vulnerability patch management?


### Layered approach for k8s security

Layers
• Infrastructure
	• Hosts
		- ?
	• Cluster Configuration
		- kube-bench: Is my Kubernetes cluster installed and configured properly?
		- checkov: Static code analysis - Are resources configured properly?
• Build
	• Application
	• Container images
		- trivy: Container image scanning - Are there vulnerabilities or misconfigurations on the 
container image?
		- grype: Are there still more vulnerabilities on the container image?
	• Deployment code
• Runtime
		- syft: Software Bill of materials (SBOM) - What components are in my application and 
container image?
		- dependency track: OWASP Dependency-Track - Do any components have newly identified 
vulnerabilities?
	• Policies
		- Open Policy Agent: Are my Kubernetes workloads and resources 
following my rules?
	• Resources
		- Goldilocks: Can a few containers hog too much 
memory or CPU?
	• Network
		- networkpolicy.io: Can Kubernetes resources reach others they don’t 
need to?
	• System calls and interaction
		- falco: Are any workloads doing something unexpected
on the system?
	• Storage 
		- [OpenEBS](https://www.cncf.io/online-programs/kubernetes-and-storage-kubernetes-for-storage-an-overview/)
		- [cubefs](https://cubefs.io/)
		- Configuration based recoverability
		- Security in a multi-tenant environment

## observability and monitoring
[Open Telemetry Monitor](https://github.com/open-telemetry/opentelemetry-operator)


## Network Policy
[Tutorial Link](https://github.com/networkpolicy/tutorial)
[Kubernetes network policies](https://github.com/networkpolicy/community)



## Runtime Security

[OpenPolicyAgent](https://openpolicyagent.org), Policy-based control for cloud native environments. [5 use cases](https://thenewstack.io/open-policy-agent-the-top-5-kubernetes-admission-control-policies/)
[Falco](https://falco.org/), the cloud-native runtime security project, is the de facto Kubernetes threat detection engine
