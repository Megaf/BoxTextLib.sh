# Branches used in this repository
Understanding the use of branches and which one you should use.

## Branches

There will always be 3 active branches at any time. `stable`, `testing` and `unstable`.
`stable` branch is the one you should use as an end user and if you are not developing for the project.

* `stable` → Code on this branch will only change when there's a major version change, from version 1.5 to 2.0 for example. The code might change as well due to security updates. Code from `stable` is the code to be added to projects and distribution's repositories. `stable` will always reflect the latest stable release, and minor changes and minor added features will not come to this repository.
* `stable-updates` → `stable-updates` will include minor changes or minor new features that may be added after the stable version release. They have minor version changes, for example, 1.0 to 1.1. There will be a release that will always match code from this branch.
* `testing` → New code tests happen in the `testing` branch. Code from this branch is under testing and not considered stable or ready for production. There will be pre-releases reflecting the code on this branch.
* `unstable` → Highly unstable and experimental branch, new features and changes happen here. Please don't use this branch if you don't know what you are doing.