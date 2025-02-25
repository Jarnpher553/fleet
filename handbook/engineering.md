# Engineering

## Meetings

### Goals

* Stay in alignment across the whole organization.
* Build teams, not groups of people.
* Provide substantial time for engineers to work on "focused work".

### Principles

* Keep meetings to a minimum. Sometimes that will be very very few meetings, and sometimes the minimum will be quite a few of them. But always try to reduce meetings, just like we do with process.
* Each individual must have a weekly sync 1:1 meeting with their manager. This is key to making sure each individual has a voice within the organization.
* Each team should have a fixed weekly sync check in. This helps reinforce team bonds and alignment.
* Favor async communication when possible. This is very important to make sure every stakeholder on a project can have a clear understanding of what’s happening, or what was decided, without needing to attend every meeting (i.e. if a person is sick or on vacation or just life happened.)
* If an async conversation is not proving to be effective, never hesitate to hop on a call. Always document the decisions made in a ticket, document, or whatever makes sense for the conversation.

The following is the subset of proposed engineering meetings. Each group is free to treat these as a subset of the expected meetings, and add any other meetings as they see fit.

### Eng Together (Weekly ~ 1 hour)
Promote cohesion across groups in the engineering team. Disseminate engineering-wide announcements.

#### Participants
All of engineering

#### Sample agenda
- Announcements
- “Show and tell”
  - Each engineer gets 2 minutes to explain (showing, if desired) what they are working on, and why it’s important to the business and/or engineering team.
- Deeper dive
  - One or a few engineers go deeper on a topic relevant to all of engineering.
- Social
  - Structured and/or unstructured social activities

### Release Retro (Each release ~ 30 minutes)
Gather feedback from all participants in each release. Used to improve communication and processes.

This meeting will likely need to be split in the future as the number of attendees increases.

#### Participants
Members of each group (+ quality)

#### Sample agenda
For each attendee:
- What went well this release cycle?
- What could have gone better this release cycle?
- What should we remember next time?

### Group Weeklies (Weekly ~ 30 minutes - 1 hour)
A chance for deeper, synchronous discussion on topics relevant to that group.

eg. “Interface Weekly” - “Platform Weekly” - “Agent Weekly”

In some groups, this may be split into smaller discussions related to the differing focuses of members within the group.

#### Participants
Members of each group

#### Sample agenda (Platform)
- Announcements
- Anything at risk for the release?
- Bug assignment
- Retries in the datastore
- Platform scale gotchas doc
- MarshalJSON to hide passwords and API tokens. Thoughts?

#### Sample Agenda (Interface)
- What’s good?
- Anything at risk for the release?
- Bug assignment
- Confirm response payload matches spec
- Discuss completion of Redux removal

### Standup (Optional, varies by group)

Provide status reports, discover blockers, and keep the group in sync.

Each group can implement daily (or some other cadence) standups if desired. Ultimately, it’s up to the Engineering Manager to ensure that the team is communicating appropriately to deliver results.

#### Participants
Members of the group

### Engineering Leadership Weekly (Weekly ~ 1 hour)
Engineering leaders discuss topics of importance that week.

#### Participants
CTO + Engineering managers

#### Sample agenda
- Fullstack engineer hiring
- Engineering process discussion
- Review Q2 OKRs

### Product/Eng Weekly (Weekly - 30 minutes)
Engineering and Product sync on priorities for the upcoming release, surface and address any inter-group dependencies.

#### Participants
CTO + Engineering managers + PMs

#### Sample agenda
- Plan for what's going into next release
- Identify inter-group dependencies
- Ensure items are moving through architect/estimation


## Release process

This section outlines the release process at Fleet.

The current release cadence is once every 3 weeks and concentrated around Wednesdays.

### Release freeze period

In order to ensure quality releases, Fleet has a freeze period for testing prior to each release. Effective at the start of the freeze period, new feature work will not be merged.

Release blocking bugs are exempt from the freeze period and are defined by the same rules as patch releases, which include:
1. Regressions
2. Security concerns
3. Issues with features targeted for current release

Non-release blocking bugs may include known issues that were not targeted for the current release, or newly documented behaviors that reproduce in older stable versions. These may be addressed during a release period by mutual agreement between the [Product](./product.md) and Engineering teams.

### Release day

Documentation on completing the release process can be found
[here](../docs/Contributing/Releasing-Fleet.md).

## On-call rotation

This section outlines the on-call rotation at Fleet.

The on-call engineer is responsible for responding to technical Slack comments, Slack threads, and GitHub issues raised by customers and the community which cannot be handled by the [Customer Success team](./customers.md).

### Goals
Our primary quality objectives are *customer service* and *defect reduction*. We use the following Key Performance Indicators (KPIs) to measure our success with these goals:

- Customer response time.
- The number of bugs resolved per release cycle.
- Stay abreast of what our community wants and the problems they're having.
- Make people feel heard and understood.
- Celebrate contributions.
- Triage bugs, identify community feature requests, community pull requests, and community questions.

### How?

- Folks who post a new comment in Slack or issue on GitHub **must** receive a response from the on-call engineer **within 1 business day**. The response doesn't need to include an immediate answer.
- The on-call engineer can discuss any items that require assistance at the end of the daily standup. They are also requested to attend the "Customer experience standup" where they can bring questions and stay abreast of what's happening with our customers.
- If you do not understand a question or comment raised, [request more details](#requesting-more-details) to best understand the next steps.
- If an appropriate response is outside your scope, please post to `#help-oncall`, a confidential Slack channel in the Fleet Slack workspace.

- If things get heated, remember to stay [positive and helpful](https://canny.io/blog/moderating-user-comments-diplomatically/).  If you aren't sure how best to respond in a positive way, or if you see behavior that violates the Fleet code of conduct, get help.

### Requesting more details

Typically, the *questions*, *bug reports*, and *feature requests* raised by members of the community will be missing helpful context, recreation steps, or motivations respectively.

❓ For questions that you don't immediately know the answer to, it's helpful to ask follow-up questions to receive additional context.

- Let's say a community member asks the question "How do I do X in Fleet?" A follow-up question could be "What are you attempting to accomplish by doing X?"
- This way, you have additional details when the primary question is brought to the Roundup meeting. In addition, the community member receives a response and feels heard.

🦟 For bug reports, it's helpful to ask for recreation steps so you're later able to verify the bug exists.

- Let's say a community member submits a bug report. An example follow-up question could be "Can you please walk me through how you encountered this issue so that I can attempt to recreate it?"
- This way, you now have steps that verify whether the bug exists in Fleet or if the issue is specific to the community member's environment. If the latter, you now have additional information for further investigation and question-asking.

💡 For feature requests, it's helpful to ask follow-up questions in an attempt to understand the "Why?" or underlying motivation behind the request.

- Let's say a community member submits the feature request "I want the ability to do X in Fleet." A follow-up question could be "If you were able to do X in Fleet, what's the next action you would take?" or "Why do you want to do X in Fleet?."
- Both of these questions provide helpful context on the underlying motivation behind the feature request when it is brought to the Roundup meeting. In addition, the community member receives a response and feels heard.

### Feature requests

If the feature is requested by a customer, the on-call engineer is requested to create a feature request issue and follow up with the customer by linking them to this issue. This way, the customer can add additional comments or feedback to the newly filed feature request issue.

If the feature is requested by anyone other than a customer (ex. user in #fleet Slack), the on-call engineer is requested to point the user to the [feature request GitHub issue template](https://github.com/fleetdm/fleet/issues/new?assignees=&labels=idea&template=feature-request.md&title=) and kindly ask the user to create a feature request.

### Closing issues

It is often a good idea to let the original poster (OP) close their issue themselves since they are usually well equipped to decide whether the issue is resolved.   In some cases, circling back with the OP can be impractical, and for the sake of speed, issues might get closed.

Keep in mind that this can feel jarring to the OP.  The effect is worse if issues are closed automatically by a bot (See [balderashy/sails#3423](https://github.com/balderdashy/sails/issues/3423#issuecomment-169751072) and [balderdashy/sails#4057](https://github.com/balderdashy/sails/issues/4057) for examples of this).

### Version support

In order to provide the most accurate and efficient support, Fleet will only target fixes based on the latest released version. Fixes in current versions will not be backported to older releases.

Community version supported for bug fixes: **Latest version only**

Community support for support/troubleshooting: **Current major version**

Premium version supported for bug fixes: **Latest version only**

Premium support for support/troubleshooting: **All versions**

### Sources

There are four sources that the on-call engineer should monitor for activity:

1. Customer Slack channels - Found under the "Connections" section in Slack. These channels are usually titled "at-insert-customer-name-here."

2. Community chatroom - https://osquery.slack.com, #fleet channel

3. Reported bugs - [GitHub issues with the "bug" and ":reproduce" label](https://github.com/fleetdm/fleet/issues?q=is%3Aissue+is%3Aopen+label%3Abug+label%3A%3Areproduce). Please remove the ":reproduce" label after you've followed up in the issue.

4. Pull requests opened by the community - [GitHub open pull requests](https://github.com/fleetdm/fleet/pulls?q=is%3Apr+is%3Aopen)

### Tools

There is a script located in `scripts/on-call` for use during on-call rotation (only been tested on macOS and Linux).
Its use is completely optional but contains several useful commands for checking issues and PRs that may require attention.
You will need to install the following tools in order to use it:

- [Github CLI](https://cli.github.com/manual/installation)
- [jq](https://stedolan.github.io/jq/download/)

### Resources

There are several locations in Fleet's public and internal documentation that can be helpful when answering questions raised by the community:

1. The frequently asked question (FAQ) documents in each section are found in the `/docs` folder. These documents are the [Using Fleet FAQ](../docs/Using-Fleet/FAQ.md), [Deploying FAQ](../docs/Deploying/FAQ.md), and [Contributing FAQ](../docs/Contributing/FAQ.md).

2. The [Internal FAQ](https://docs.google.com/document/d/1I6pJ3vz0EE-qE13VmpE2G3gd5zA1m3bb_u8Q2G3Gmp0/edit#heading=h.ltavvjy511qv) document.

### Handoff

Every week, the on-call engineer changes. Here are some tips for making this handoff go smoothly:

1. The new on-call engineer should change the `@oncall` alias in Slack to point to them. In the
   search box, type "people" and select "People & user groups". Switch to the "User groups" tab.
   Click `@oncall`. In the right sidebar, click "Edit Members". Remove the former on-call, and add
   yourself.

2. Handoff newer conversations. For newer threads, the former on-call can unsubscribe from the
   thread, and the new on-call should subscribe. The former on-call should explicitly share each of
   these threads, and the new on-call can select "Get notified about new replies" in the "..." menu.
   The former on-call can select "Turn off notifications for replies" in that same menu. It can be
   helpful for the former on-call to remain available for any conversations they were deeply involved
   in, so use your judgment on which threads to handoff.

## Rituals

The following rituals are engaged in by the  directly responsible individual (DRI) and at the frequency specified for the ritual.

| Ritual                       | Frequency                | Description                                         | DRI               |
|:-----------------------------|:-----------------------------|:----------------------------------------------------|-------------------|
| Stand up | Daily | Discuss items being worked during the current iteration and any blockers. | Zach Wasserman |
| Pull request review | Daily | Engineers go through pull requests on which their review has been requested. | Zach Wasserman |
| Engineering group discussions | Weekly | Engineering groups meet to discuss issues in depth that are too big or complex to discuss adequately during a stand up. | Zach Wasserman |
| On-call handoff | Weekly | Handoff the on-call engineering responsibilities to the next on-call engineer. | Zach Wasserman |
| Release ritual | Every three weeks | Go through the process of releasing the next iteration of Fleet. | Zach Wasserman |


## Project boards

[🚀 Release](https://github.com/orgs/fleetdm/projects/40) - The current release (daily go-to board) for engineers.

[⚗️ Roadmap](https://github.com/orgs/fleetdm/projects/41) - Planning for the next release (shared with product).

## Slack channels

The following [Slack channels are maintained](https://fleetdm.com/handbook/company#group-slack-channels) by this group:

| Slack channel                       | [DRI](https://fleetdm.com/handbook/company#group-slack-channels)    |
|:------------------------------------|:--------------------------------------------------------------------|
| `#help-engineering`                 | Zach Wasserman
| `#g-platform`                       | Tomás Touceda
| `#g-interface`                      | Luke Heath
| `#g-agent`                          | Zach Wasserman
| `#_pov-environments`                | Ben Edwards



<meta name="maintainedBy" value="zwass">
