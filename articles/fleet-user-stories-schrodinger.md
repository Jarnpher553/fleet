# Fleet user stories

## Jason Walton — Director of information security @ Schrödinger

![Four speech bubbles and four stars emanating from the Fleet logo](https://miro.medium.com/1*uAZ-YhsFJIhNCl1Cz-lVxQ.jpeg)

Jason Walton gives us some insight into how his team uses Fleet and osquery at Schrödinger.

### How did you first get started using osquery?

I became aware of osquery a number of years ago — maybe 2017 when a colleague mentioned it. I experimented with it locally, and it was very interesting, but I never invested much time until I discovered Fleet (then Kolide Fleet) I believe around 2018.

### Why are you using Fleet?

It’s easy to deploy and use in combination with [Launcher](https://github.com/kolide/launcher). It provides me with a single source of truth about endpoints in my organization, and provides a separate “reporting plane” independent of tools used to configure or manage systems. Aggregating data across platforms is also extremely helpful.

### How do your end users feel about Fleet?

Our end users don’t notice it’s there — and we have *extremely* technical end users. This differs from other tools like our EDR solution which can occasionally cause performance issues. It’s a very lightweight tool.

### How are you dealing with alert fatigue and false positives from your SIEM?

We actually don’t use a SIEM for this reason. We rely on alerts and signals from individual tools that have high fidelity.

### How could Fleet be better?

I’ll admit to not liking SQL much. It would be handy to have a query builder for simpler queries. For more advanced queries, perhaps something like Logica that compiles down to SQL but can be nicer to use would be interesting. There’s also a lot of confusion I see from newcomers to osquery and Fleet who want to know where to get results from scheduled queries. Some detailed documentation on possible solutions for this (ELK, or maybe BigQuery?) would go a long way to getting people started.

<meta name="category" value="success stories">
<meta name="authorGitHubUsername" value="mike-j-thomas">
<meta name="authorFullName" value="Mike Thomas">
<meta name="publishedOn" value="2021-09-10">
<meta name="articleTitle" value="Fleet user stories — Schrödinger">
<meta name="articleImageUrl" value="https://miro.medium.com/1*uAZ-YhsFJIhNCl1Cz-lVxQ.jpeg">