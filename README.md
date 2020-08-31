<p align="center">
    <img src="https://github.com/sonatype-nexus-community/ahab/blob/master/docs/images/ahab.png" width="350"/>
</p>

# Example Ahab Repo

[ahab](https://github.com/sonatype-nexus-community/ahab) is a tool to check for vulnerabilities in your apt or yum powered operating systems, powered by [Sonatype OSS Index](https://ossindex.sonatype.org/).

This repo is just an example of running Ahab in a Docker build, on CircleCI.

You can get more information on Ahab by browsing to [the repository for it](https://github.com/sonatype-nexus-community/ahab). 

You can see it fail quite wonderfuly at [![CircleCI](https://circleci.com/gh/sonatype-nexus-community/example-ahab-repo.svg?style=svg)](https://circleci.com/gh/sonatype-nexus-community/example-ahab-repo)

## Why is this useful?

Well, we'd hope it is easy enough to see why, but what you can do with `ahab` is inject a command similar to the following in your `Dockerfile`:

```
    RUN dpkg-query --show --showformat='${Package} ${Version}\n' | ./ahab chase
```

Since `ahab` will exit with a non zero code if vulnerabilities are found, you can use `ahab` to prevent images with vulnerabilities from being built, serving as a gate in your CI/CD process. `ahab` does not replace checking your own applications for vulnerable dependencies, etc..., but as the container has become more and more important to how an application eventually ends up in Production, checking that base image itself is critical as well.

A suggested setup would be to have a base image similar to:

```
FROM ubuntu:latest

RUN apt-get update && apt-get install pip

RUN ./script_to_install_ahab.sh

RUN dpkg-query --show --showformat='${Package} ${Version}\n' | ./ahab chase
```

Using this base image, you'd install all the packages necessary to run your application, and check it as a last step with `ahab` to ensure you aren't using anything vulnerable. From here, you'd use this base image to import your application, build it, etc... as you normally would, knowing you started from a clean base.

## The Fine Print

It is worth noting that this is **NOT SUPPORTED** by Sonatype, and is a contribution of ours
to the open source community (read: you!)

Remember:

* Use this contribution at the risk tolerance that you have
* Do NOT file Sonatype support tickets related to `ahab` support in regard to this project
* DO file issues here on GitHub, so that the community can pitch in

Phew, that was easier than I thought. Last but not least of all:

Have fun creating and using `ahab` and the [Sonatype OSS Index](https://ossindex.sonatype.org/), we are glad to have you here!

## Getting help

Looking to contribute to our code but need some help? There's a few ways to get information:

* Chat with us on [Gitter](https://gitter.im/sonatype/nexus-developers)
