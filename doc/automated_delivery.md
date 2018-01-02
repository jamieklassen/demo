# Automated Delivery Demo

## Problem

CIBC has some conventions around delivering web services: the existence, for example,
of a graduated series of long-lived deployment environments in which separate quality control
processes occur. Typically the delivery process looks something like this:

1. Deploy to dev environment as desired by devs.
2. Dev lead signs off on deployment to SIT.
3. QA runs test cases in SIT; when satisfied, QA lead signs off on deployment to UAT.
4. Product Owner and QA verify quality of app in UAT, eventually signing off on deployment to
   Prod.

If we view this whole delivery framework as a means of creating value, then one incremental
addition of value corresponds to a change traversing the entire sequence of environments and
testing. This value-centric perspective suggests using some of the techniques of DevOps to
optimize the delivery of value. For example, manually coordinated handoffs tend to introduce
some degree of inconsistency (human error) and scheduling deployments can cause potentially
avoidable waiting time -- these are facts that a lean manufacturing-inspired viewpoint would
categorize as waste, which automated tools could be used to eliminate.

## Solution

I intend to create a mock pipeline as a proof-of-concept for how automation could be
introduced to the current set of conventions. Generally the purpose of this mock pipeline is
to educate, when presented to audiences of technically-capable folks with an interest in DevOps, 
as part of a live talk and demo. Initially, the pipeline will consist of the following technical
components:

- a code repository, hosted on GitHub, for a Spring Boot sample web service
- a Jenkins server, running on my laptop
- the deployment environments (SIT, UAT and Prod) running as separate tomcat processes on my
  laptop. These environments will be described using a single Packer template, and though they
  will be deployed as simple Docker containers for the purposes of the demo, Packer can provision
  for many other infrastructures, including VirtualBox, VMWare and Amazon EBS.

Initially the demo will consist of traversing a "happy path" usage of this system. I anticipate
that there will be many opportunities to discuss potential edge cases and the subtler ways that
automated delivery can add value to a software project.

The first part of the presentation involves a light description of Packer and its use in
infrastructure-as-code as well as the suggestion that it could be used for cloud deployments.
I will thereafter pretend to be a developer tasked with adding a feature to the app, demonstrating
the following:

1. I make my code changes
2. I push a commit, triggering a build on Jenkins
3. The code is built and unit tests are run
4. The build is successful and the resulting WAR file is persisted in an artifact store
5. The artifact is deployed to SIT and functional tests are run
6. Tests are successful, and the same artifact is deployed to PAT, where performance tests
   are run
7. The same artifact is deployed to Prod
