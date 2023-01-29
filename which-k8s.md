# 📙 Choosing right k8s distribution

Choosing right distribution for k8s is very simple. This documeent is purely focused on running k8s workload on-prem and x64 and amd64.
Setting up lab on arm64 is not on priority but we will take it on later stage.

For choosing right k8s distribution, we have identified features as below:
- Container Runtime
- Supported Machine Architectures
- Supported Host OS
- Support for eBPF
- Control Plane Datastore
- Built-In Security & Conformance
- Supported CNI Providers
- Supported Storage & CSI Providers
- Built-In Security Features
- Built-In Cluster Features
- Opensource

## Container Network Interface (CNI) Providers

CNI (Container Network Interface), a Cloud Native Computing Foundation project, consists of a specification and libraries for writing plugins to configure network interfaces in Linux containers, along with a number of plugins. 
CNI concerns itself only with network connectivity of containers and removing allocated resources when the container is deleted.

### CNI Features by Provider
| Provider |                Network Model                | Route Distribution | Network Policies | Mesh | External Datastore | Encryption | Ingress/Egress Policies |
|:--------:|:-------------------------------------------:|:------------------:|:----------------:|:----:|:------------------:|:----------:|:-----------------------:|
| Canal    | Encapsulated (VXLAN)                        | No                 | Yes              | No   | K8s API            | Yes        | Yes                     |
| Flannel  | Encapsulated (VXLAN)                        | No                 | No               | No   | K8s API            | Yes        | No                      |
| Calico   | Encapsulated (VXLAN,IPIP) OR Unencapsulated | Yes                | Yes              | Yes  | Etcd and K8s API   | Yes        | Yes                     |
| Weave    | Encapsulated                                | Yes                | Yes              | Yes  | No                 | Yes        | Yes                     |
| Cilium   | Encapsulated (VXLAN)                        | Yes                | Yes              | Yes  | Etcd and K8s API   | Yes        | Yes                     |
*[source](https://ranchermanager.docs.rancher.com/faq/container-network-interface-providers)

Based on comparision and poppularity, we are choosing "Cilium" as CNI provider.

# k8s distribution

Let's begin our journe to start testing candidates based on above parameters.

## OKD.io Community Distribution of Kubernetes++

For on-prem version, it is easy to setup with Openshift codebase + Fedora CoreOS

It supports automated installation, patching, and updates from OS up.

[Get OKD image](https://console.redhat.com/)

[![How to setup OKD on Fedora CoreOS](https://img.youtube.com/vi/3aaaEGWrbX4/0.jpg)](https://www.youtube.com/watch?v=3aaaEGWrbX4)


## k0s - [k0sproject](https://k0sproject.io/) The Simple, Solid & Certified Kubernetes Distribution

k0s provides zero Friction, Deps and Cost

- Zero Friction
	k0s drastically reduces the complexity of installing and running a fully conformant Kubernetes distribution. 
	New kube clusters can be bootstrapped in minutes. Developer friction is reduced to zero, allowing anyone, with no special skills or expertise in Kubernetes to easily get started.

- Zero Deps
	k0s is distributed as a single binary with zero host OS dependencies besides the host OS kernel. 
	It works with any operating system without additional software packages or configuration. Any security vulnerabilities or performance issues can be fixed directly in the k0s distribution.
	
- Zero Cost
	k0s is completely free for personal or commercial use, and it always will be. 
	The source code is available on [GitHub](https://github.com/k0sproject/k0s) under Apache 2 license. 
	It's a no brainer foundation for any Kubernetes projects and easy build upon.
	
	
## Comparision

OKD, previously known as OpenShift Origin, is a distribution of Kubernetes that is developed and maintained by Red Hat. 
It is built on top of Kubernetes and adds additional features and functionality to make it more enterprise-ready. 
It includes a web console, command-line tools, and an API, which makes it easy to manage and scale applications.

In comparison to k0s, OKD is more feature-rich and enterprise-ready, with additional functionality such as built-in continuous integration and continuous delivery (CI/CD), role-based access control (RBAC), and support for multiple languages and frameworks.

In comparison to kops, OKD is more opinionated and provides a more comprehensive platform for managing and scaling applications. It also has a built-in web console and command-line tools that make it easy to manage and scale applications.

In summary, k0s is a lightweight and easy-to-use Kubernetes distribution, kops is a tool for creating and managing production-grade Kubernetes clusters, and OKD is a distribution of Kubernetes that is built on top of Kubernetes and adds additional features and functionality to make it more enterprise-ready.