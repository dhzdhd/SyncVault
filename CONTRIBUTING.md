# Contributing

## Steps to follow

- Fork the repository.

- Clone your forked copy of the project into your local system. `git clone --depth 1 https://github.com/<your_name>/SyncVault.git`

- Navigate to the project directory. `cd SyncVault`

- Add a reference (remote) to the original repository. `git remote add upstream https://github.com/dhzdhd/SyncVault`

- Check the remotes for this repository. `git remote -v`

- Always take a pull from the upstream repository to your master branch to keep it at par with the main project (updated repository). `git pull upstream main`

- Create a new branch. `git checkout -b <your_branch_name>` Prefix the branch name with the label. For example if you are working on a feature, prefix it with `feat-` or `feat/`

- Perform your desired changes to the code base.

- Track your changes. `git add .`

- Commit your changes.
[Check this link](https://initialcommit.com/blog/git-commit-messages-best-practices) for good practices. `git commit -m "a Commit message"`

- Push the committed changes in your feature branch to your remote repository. `git push -u origin <your_branch_name>`

- To create a pull request, click on compare and pull requests. Please ensure you compare your feature branch to the main branch and then make a PR. Add appropriate title and description to your pull request explaining your changes and efforts done.

- Click on Create Pull Request.

- Voila! You have made a PR to the project. Sit back and relax while your PR is reviewed by the maintainers.
