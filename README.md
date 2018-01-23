# SA instructions and links for setting up the 2-3 hour DCA workshop

#### In Progress Jan 2017
#### maintainer: Karen Kwentus

## Goal for this workshop
A contained, highly-repeatable method to give our customers hands-on experience and education about the benefits of using Chef Automate while removing the overhead and time commitment of a week-long POC.   Best-case scenario, this content preempts the need for a future POC at all.   This is designed to be a 'workshop in a box' where we can show up, impress, and leave.  Timetable allows the potential for an individual SE to support multiple of these a week.   


## Audience
Practioners or managers who influence the purchase of Chef Automate

## Logistics 
* Workshop content without all the "optionals" is around 2-3 hours.   If you do the optional CM and remote-scan use cases then you will want to schedule closer to 4 hours.  
* The workshop is recommended to be held at a customer site.  Participants will only need laptops that can access the internet and the hosted Chef Automate instance   
* Overhead projector required, whiteboard recommended.    
* Consider providing breakfast or lunch based on timing of meeting.   
* Any number of participants can work through this workshop, but with over 10 participants consider adding another SA to assist.

 
## Assumptions
* Workflow is not addressed in this workshop
* How to bootstrap is not addressed in this workshop as we are looking at it from a scenario where users can log into Automate and already see what is being managed/scanned.  If its important for your customer to see bootstrapping, you of course come with the nodes running but not yet bootstrapped and have your participants execute a knife command


### Workshop in the cloud
This workshop has been designed to be hosted in a cloud/BJC environment for the both Chef Automate and the managed nodes to be scanned/repaired.  There isn't anything required about BJC persay, you can use a blank AWS/Azure marketplace image as well.

As technical professionals it is at your discretion if you want to run this full workshop against on-prem customer nodes at the client site.   

Running full Detect & Correct on customer on-prem nodes will add additional planning and time in the form of
* Understanding the cloud VPNs and network setups of your hosted Automate session.
* Customer firewall, proxy settings and VPNs that need to be modified allow communicating to the on-prem nodes on port 8443. 
* Prep time.    **If you choose to do this full workshop against customer on-prem nodes it is highly recommended that you ensure that the customer’s on-prem nodes can be managed and scanned by your Automate instance once week before the workshop.**


### On-site scan-only option (See Appendix III for more details)
If seeing a scan on their own nodes is really important to the customer, and-or it would preempt a future POC, then consider offering a remote-scan scan as part of the workshop
* Benefits of just an on-site scan:
    - Don't need to install the chef-client on the node
    - Won't be doing any sort of modification of any customer node, nothing will leave broken
* Cons of doing the on-site scan:
    - You are getting yourself back into requesting and managing the customer firewall-proxy access.  Customer nodes will have to allow SSH or RDP through their network in order for Automate to scan.  Assume by default the customer's networks do not grant such access. Give yourself enough time in advance to make sure your instance can scan a test node.


## High Level Agenda
1.  Introduction of participants and the discussion of the goals of the workshop.
   * Optional: Depending on the makeup of the group and their knowledge of Chef it may make sense to give a 20-30 minutes whiteboard/discussion of what Chef Automate is and what problems it can solve for the customer

2.  Optional: Basic Configuration Management/Drift Detection use case: Show how to apply basic IIS and/or Linux OS configuration cookbooks against newly created nodes (See *Appendix I* for more info)

3. Instructor presentation of the slide-driven walkthrough of the steps in a Detect & Correct scenario  (put PPT link included in this repo)

4. Have all participants open Chef Automate on their laptop and assign each their node based on playing card suites

5. Instuctor-led, but full group participation walkthrough of the first Detect-correct scenario
  * Look at *Appendix II* for examples of controls to fix.  Depending on the needs and composition of your participants you can of course choose any controls or profiles you want

6. Assign additional control(s) (depending on time) for all participants to 'Detect and Correct'.  Work the room helping individuals as needed.  At the end of the allotted time (suggestion: 10-15 minutes per control) go through the solution as a group

7. Have the participants apply a full DevSec hardening cookbook to their node, aka add it to their runlist, and then go back into Compliance to see all the updated/fixed controls.

**Test the DevSec hardening cookbook in advance to see if it fixes all controls or if there are bugs and controls left unfixed**  This is an open source cookbook, sometimes controls comeback still failling.  If controls are unfixed you can either make a local copy and update the cookbook itself if possible (and maybe even submit the fix back to DevSec as a pull request).  Else at least understand a bug has been introduced and be prepared to acknowledge it.

8.  Optional: Execute 'On-site scan-only option'.  (See *Appendix III* for more info)




## Setup
1.	Spin-up a standard BJC environment or AWS/Azure marketplace environment.  It is recommended you spin up a BJC instance at least 1 full day before the workshop is scheduled for shakeout and configuration activities.   When you spin up the instance make sure and extend the hours lifetime of the instance to be up past the estimated time of completion for the workshop.

2. Upload the "dca_config" cookbook stored in this repo to your Chef Server.
* This cookbook will both set the chef-client to checkin at regular instances, and will also set default compliance profiles for the nodes to scan based on OS.  
* Before uploading this repo you can of course make a local copy and modify the attributes to add/remove profiles to get the exact behavior you want.

3.	Create and bootstrap all the nodes you will need.  Multiple OS flavors of nodes can definitely be used in the workshop. Create a couple nodes for yourself as admin for shakeout-test. Create one node per OS per expected participant (and some extras for the unexpected ones).  
* When bootstrapping, name each node using the card-suite method (1ofhearts, 2ofhearts, 1ofspades, 2ofspades, etc).    
* Bootstrap with a runlist that includes the "dca_config" cookbook


4. Upload the desired DevSec hardening cookbook into your Chef Server.
* https://github.com/dev-sec/chef-os-hardening

* https://github.com/dev-sec/chef-ssh-hardening

* https://github.com/dev-sec/chef-windows-hardening

5. Test the entire scenario on one of your testing nodes

## Appendix I - Optional configuration management and drift use case
links to cookbooks
descriptions of what cookbooks do
suggested steps

## Appendix II -- recommended/example controls for Detect & Correct 
*It is very important that you review and test any controls you want to Detect/Correct before you go onsite.....profiles and base OS configurations change often.  Bugs can be introduced and behavior can change.  Make sure you know what controls you want to run during this workshop, and confirm your assumptions on how the fix functions.*



## Appendix III -- Optional remote scan use case
*Remember, doing remote scan assumes previous testing/confirmation of network access for the BJC automate instance to be able to RDP or SSH into customer nodes with firewall and/or proxy rule configuration*

 Execute a remote-scan of one or multiple customer nodes against a standard CIS profile using the same Automate instance used for the rest of the workshop.  

 If you run this use-case at the end of the workshop the participants will already be very familiar with Detect/Correct and you can wrap up the workshop by saying "now lets looks at the state of a node in your environment vs a CIS hardening standard for the OS".  

Focus on the ease of scanning and gathering data to find the information they need in order to plan on moving forward to making those nodes compliance.  In order to correct they will in the future need to manage those nodes with Chef and apply cookbooks in the exact manner they have today in the workshop.  And then once the chef-client is on the node the Detect phase can be scheduled to be executed at a regular interval so the compliance data is always up to date.





