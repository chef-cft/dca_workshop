# SA instructions and links for setting up the 2-3 hour DCA workshop

### In Progress Jan 2017
### maintainer: Karen Kwentus

## Goal for this workshop
A contained, highly-repeatable method to give our customers hands-on experience and education about the benefits of using Chef Automate while removing the overhead and time commitment of a week-long POC.   Best-case scenario, this content pre-empts the need for a future POC at all.   This is designed to be a 'workshop in a box' where we can show up, impress, and leave....with the potential for an individual SE to support multiple of these a week.   


## Audience
Practioners or managers who influence the purchase of Chef Automate
 

## Using Chef Automate in the cloud
This workshop has been designed to be hosted in a cloud/BJC environment for the bot the Chef Automate environment and the managed nodes to be scanned/repaired.  There isn't anything required about BJC persay, you can use a blank AWS/Azure marketplace image as well, just more setup on your part.

As technical professionals it is at your discretion if you want to run this full workshop against on-prem customer nodes at the client site.   

Scanning customer on-prem nodes will add additional planning and time in the form of:
•	Understanding the cloud VPNs and network setups of your hosted Automate session.
•	Customer firewall, proxy settings and VPNs that need to be modified allow communicating to the on-prem nodes on port 8443. 

**If you choose to do this against on-prem nodes it is highly recommended that you ensure that the customer’s on-prem nodes can be managed and scanned by your Automate instance once week before the workshop.**


### On-site scan-only option
If doing something in their own nodes is really important to the customer, and-or it would pre-empt a future POC, then consider offering a remote-scan scan step as part of the workshop
··* Benefits of just an on-site scan:
    - Don't need to install the chef-client on the node
    - Won't be doing any sort of modification of any customer node
··* Cons of doing the on-site scan:
    - You are getting yourself back into the customer firewall-proxy access do-se-do.  Even with SSH or RDP access the Chef Automate instance is very likely still going to need to be able to go through the customer's firewal or proxy setups.   Give yourself enough time in advance to make sure your instance can connect.


## High Level Agenda
1.  Introduction of participants and the discussion of the goals of the workshop
···Optional: Depending on the makeup of the group and their knowledge of Chef it may make sense to give a 20-30 minutes whiteboard/discussion of what Chef Automate is and what problems it can solve for the customer

2.  Optional: Using Chef Automate remote-scan capability, aka no chef-client, remote-scan one or multiple customer nodes against a standard CIS profile.  
··* This assumes confirmation of network access for the BJC automate instance to be able to RDP or SSH into customer nodes with firewall and/or proxy rule configuration  

3. Instructor presentation of the slide-driven walkthrough of the steps in a Detect & Correct scenario  (put PPT link included in this repo)

4. Have all participants open Chef Automate on their laptop and assign each their node based on playing card suites

5. Instuctor-led, but full group participation walkthrough of the first Detect-correct scenario
··* look at appendix below for suggested controls to fix

6. Assign additional control (or more depending on time) for all participants to 'Detect and Correct'.  Work the room helping individuals as needed.  At the end of the allotted time (suggestion: 15 minutes) go through the solution as a group

7. Have the participants apply the full DevSec fix cookbook to their node


## Appendix -- put link to google doc here?
