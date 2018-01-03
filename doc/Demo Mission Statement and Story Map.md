# Automated Delivery Demo

## Mission Statement

The DevOps demo is designed to illustrate the 
operation of a DevOps Delivery pipeline. There are a number of goals the Demo is designed to achieve,

	1. provide a lightweight technical introduction to DevOps
	2. illustrate the value of a Delivery pipeline
	3. demonstrate the operation of DevOps tools in the context of a Delivery pipeline
	4. Be a catalyst for conversations on how to optimize CIBC deployment processes

The demo will show the following benefits of DevOps

	1. How DevOps increases business agility
	2. How DevOps increases system stability
	3. The value of immutable pipelines
	4. The value of maintaining environment parity across all environments
	5. How compliance requirements can be implemented with a Delivery pipeline
	6. How audit requirements can be met with a Delivery pipeline
	7. How security requirements can be met with a Delivery pipeline

## Story Map

Here is a high level story map of the Demo

	
	- Illustrate the continuous integration/continuous delivery process by 
		committing changes to a code repository and then have an orchestration
		tool execute the following steps
		1. kick off a suite of unit tests to confirm the validity of the change
		2. Upon successful completion of step 1, deploy to a SIT environment and kick off a suite of integration and functional tests
		3. Upon successful completion of step 2, deploy to a UAT/PAT environment and execute a suite of performance tests
	- Discuss segregation of duties compliance by discussing how environments can be locked down to only allow deployment by the Delivery pipeline (orchestration tool) 
	- Discuss audit compliance by showing how orchestration tool can generate audit logs and audit reports
	- Illustrate value of integrating the environment provisioning process into the Delivery process by using an infrastructure provisioning tool to update an infrastructure provisioning script to use a new version of an application server and have the change go through the same CI/CD process as above to push the change all the way to production
		- Show how IaC script also uses automated tests 
	- Illustrate value of fast feedback by checking in a change to the code that causes a functional or integration test to fail. The developer is immediately informed and makes an appropriate fix which is then checked in and immediately goes through the ci/cd process successfully
		- developer adds an automted test to the regression test suite


Other nice to haves

	- discuss/illustrate how increased collaboration can be achieved with Slack
	- show reporting dashboard that highlights relevant DevOps metrics (number of check-ins, deployment frequency, deployment failures, num defects)
	- include requirement management scenario that integrates Agile task management tool
	- include static analysis tools - possibly correct a security issue
		- discuss how other security tools can be included in Delivery pipeline
	- include monitoring scenario, show how performance tool causes a SLA violation detected by monitoring tool
 
