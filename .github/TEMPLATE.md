[comment]: ####### (Pull Request to Staging - Feature is ready to be reviewed)
[comment]: ####### (PR Name format: my-branch-name)
[comment]: ####### (Assign it to at least 3 devs)
[comment]: ####### (Add Tag "Ready to Review")

[Asana Ticket](https://linktoyour.ticket) | [Airbrake Bug](https://linktoyour.bug)

Changes introduced in this Pull Request:
- Added X
- Removed Y
- Improved Z

---------------------------------------------
[comment]: ####### (Pull Request to Release - Feature is ready to production)
[comment]: ####### (PR Name format: my-branch-name)
[comment]: ####### (Add Tag "Ready to Production")

[Asana Ticket](https://linktoyour.ticket) | [Airbrake Bug](https://linktoyour.bug)

**Migrations**: Yes or No
**New translations**: Yes or No
**To be deployed with**: course-builder, course-player, course-player-v2, webhooks or None (link to corresponding PRs)
**Must run rake task**: rake name_of:the_rake_task or No

---------------------------------------------
[comment]: ####### (Pull Request to Master - Features are ready to be deployed)
[comment]: ####### (PR Name format: Release 2017-01-26--15-30)
[comment]: ####### (Add Tag "Release")

Pull Requests included in this release:
- link to pull request
- link to pull request 2

Deployment Checklist (make sure to check each one of the items before moving forward with the deployment):
- [] I already done at least one deployment by myself
- [] I have a plan B in case anything go wrong to quickly recover the app
- [] I'm at the office or I'm at home and my IP address is whitelisted in AWS
- [] I'm in the working hours window (8-9 am PST to 3-4 pm PST) or it is a hotfix
- [] I installed all the prerequisites outside the Docker environment
- [] I know who the point person are and I can reach him in case something goes wrong
- [] There are no webinars or demos going on
