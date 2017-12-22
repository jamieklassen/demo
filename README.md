# Demo
## Deploy jenkins
Ensure you have [Juju](https://jujucharms.com/) and the juju-wait plugin installed and bootstrapped
for your infrastructure. Then you can run
```
ci/deploy_jenkins.sh
```
## Deploy tomcat
From the `ci/tomcat_server` directory, you should be able to run `terraform apply`. However, you
may also need to run `packer build` and copy the resulting AMI ID into the terraform template
first.

There's a bit more work to do here in terms of automating the deployment of jenkins, the pipeline,
and the tomcat server all together.
