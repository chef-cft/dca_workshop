# SA instructions and links for setting up the 2-3 hour DCA workshop

#### In Progress Jan 2017
#### maintainer: Karen Kwentus

## Goal for this workshop
A contained, highly-repeatable method to give our customers hands-on experience and education about the benefits of using Chef Automate while removing the overhead and time commitment of a week-long POC.   Best-case scenario, this content preempts the need for a future POC at all.   This is designed to be a 'workshop in a box' where we can show up, impress, and leave....with the potential for an individual SE to support multiple of these a week.   


## Audience
Practioners or managers who influence the purchase of Chef Automate

## Logistics 
Workshop content is around 2-3 hours.   The workshop is recommended to be held at a customer site with participants using their own laptops.   Overhead projector and whiteboard in room are also recommended.    Consider providing breakfast or lunch based on timing of meeting.   Any number of participants can work through this workshop, but with over 10 participants consider adding another SA to assist.

 
## Assumptions
* Workflow is not addressed in this workshop
* How-to-bootstrap is not addressed in this workshop as we are looking at it from a scenario where users can log into Automate and already see what is being managed/scanned.  If its important for your customer to see bootstrapping, you of course come with the nodes running but not yet bootstrapped and have your participants execute a knife command


### Workshop in the cloud
This workshop has been designed to be hosted in a cloud/BJC environment for the both Chef Automate and the managed nodes to be scanned/repaired.  There isn't anything required about BJC persay, you can use a blank AWS/Azure marketplace image as well, just more setup on your part.

As technical professionals it is at your discretion if you want to run this full workshop against on-prem customer nodes at the client site.   

Running full Detect & Correct on customer on-prem nodes will add additional planning and time in the form of
* Understanding the cloud VPNs and network setups of your hosted Automate session.
* Customer firewall, proxy settings and VPNs that need to be modified allow communicating to the on-prem nodes on port 8443. 
* Prep time.    **If you choose to do this full workshop against customer on-prem nodes it is highly recommended that you ensure that the customer’s on-prem nodes can be managed and scanned by your Automate instance once week before the workshop.**


### On-site scan-only option
If doing something on their own nodes is really important to the customer, and-or it would preempt a future POC, then consider offering a remote-scan scan step as part of the workshop
* Benefits of just an on-site scan:
    - Don't need to install the chef-client on the node
    - Won't be doing any sort of modification of any customer node
* Cons of doing the on-site scan:
    - You are getting yourself back into the customer firewall-proxy access do-se-do.  Even with SSH or RDP access the Chef Automate instance is very likely still going to need to be able to go through the customer's firewal or proxy setups.   Give yourself enough time in advance to make sure your instance can connect to scan.


## High Level Agenda
1.  Introduction of participants and the discussion of the goals of the workshop.
   * Optional: Depending on the makeup of the group and their knowledge of Chef it may make sense to give a 20-30 minutes whiteboard/discussion of what Chef Automate is and what problems it can solve for the customer

2.  Optional: Execute 'On-site scan-only option'.  Execute a remote-scan of one or multiple customer nodes against a standard CIS profile using the same Automate instance you will be using for the rest of the workshop.  
   * This assumes previous testing/confirmation of network access for the BJC automate instance to be able to RDP or SSH into customer nodes with firewall and/or proxy rule configuration  

3. Instructor presentation of the slide-driven walkthrough of the steps in a Detect & Correct scenario  (put PPT link included in this repo)

4. Have all participants open Chef Automate on their laptop and assign each their node based on playing card suites

5. Instuctor-led, but full group participation walkthrough of the first Detect-correct scenario
  * Look at appendix section below for suggested controls to fix.   Depending on the needs and composition of your participants you can of course choose any controls or profiles you want
  * It is very important that you review and test any controls you want to Detect/Correct before you go onsite.....profiles and base OS configurations change often.  Bugs can be introduced and behavior can change.  Make sure you know what controls you want to run during this workshop, and confirm your assumptions on how the fix functions.

6. Assign additional control(s) (depending on time) for all participants to 'Detect and Correct'.  Work the room helping individuals as needed.  At the end of the allotted time (suggestion: 15-20 minutes per control) go through the solution as a group

7. Have the participants apply a full DevSec hardening cookbook to their node, aka add it to their runlist, and watch all the lovely things it fixes.  


## Setup
1.	Spin-up a standard BJC environment.   It is recommended you spin up the instance at least 1 full day before the workshop is scheduled for shakeout and configuration activities.   When you spin up the instance make sure and extend the hours lifetime of the instance to be up past the estimated time of completion for the workshop.

2.	Create and bootstrap to the Automate instance nodes of the OS you will need.  Multiple OS flavors of nodes can definitely be used in the workshop.

* Create a couple nodes for yourself as admin for shakeout-test

* Create one node per expected participant (and some extra for the unexpected ones).  Within Chef Automate name each node using the card-suite method we use during Essentials training (1hearts, 1hearts, 1spade, 2spade, etc).    

* When you bootstrap each node, bootstrap with above naming convention and with a runlist that includes the "dca_config" cookbook stored in this repo. This cookbook will both set the chef-client to checkin at regular instances, and will also set default compliance profiles for the nodes to scan based on OS.  After downloading this repo you can of course modify the compliance profile attributes before you upload it into your Chef server to get the exact behavior you want.

4. Upload the desired DevSec hardening cookbook into your ChefServer
https://github.com/dev-sec?utf8=%E2%9C%93&q=chef&type=&language=
https://github.com/dev-sec/chef-os-hardening
https://github.com/dev-sec/chef-ssh-hardening
https://github.com/dev-sec/chef-windows-hardening

3. Test your environment, test your nodes, test your assumptions


## Appendix -- recommended/example controls for Detect & Correct 

