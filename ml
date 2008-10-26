Cookbook for the grml mailinglistsetup
======================================

Preface
-------

This is a short documentation for common tasks with the grml mailing list
setup (mailman). 

Upstream docs
-------------

http://www.gnu.org/software/mailman/index.html/[Mailman Homepage]

Introduction
------------

We use mailman in a non-vhost configuration with `ml.grml.org` as the
default host. Mailman is configured with postfix support so that new lists
willappear in `/var/lib/mailman/data/aliases` which is configured as an
alias database in `/etc/postfix/main.cf`. 

After creation of a mailinglist it can be configure via the administrative
interface at http://ml.grml.org/mailman/admin/`listname`. 

Mailman is configured to use spamassassin see
http://www.jamesh.id.au/articles/mailman-spamassassin for more information. 

List Archives
-------------

List archives are created automatically and are available via
http://ml.grml.org/pipermail/`listname` if enabled via Webfrontend
(Archiving Options->Archive messages->Yes and Archiving Options->Is archive
file source for public or private archival->public). 

Common Tasks 
------------

Add a new mailinglist
~~~~~~~~~~~~~~~~~~~~~~~

----------------------
newlist [listname [listadmin-addr [admin-password]]]
----------------------

Where `listname` is the localpart of the mailinglist address and
`listadmin-addr` the e-mail address of the list administrator. The new
admin will get an e-mail that the new list has been created with all
relevant informations included. 

Subscribe somebody to a mailinglist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can either use the webfrontend (Membership Management->Mass
Subscription) or the commandline.

----------------------------
add_members `listname`
----------------------------

Remove somebody from a mailinglist
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can either use the webfrontend (Membership Management->Mass Removal) or the commandline.

----------------------------
remove_members `listname`
----------------------------

Remove list
~~~~~~~~~~~

----------------------------
rmlist `listname`
----------------------------

List all members of a list
~~~~~~~~~~~~~~~~~~~~~~~~~~

----------------------------
list_members [listname]
----------------------------

Moderation Management
---------------------

You can manage the moderation queue via webfrontend (Tend to pending
moderator requests) or you can use listadmin (`apt-get install listadmin`). 
Here is an example config: 

----------------------------
password <siteadmin or listadminpassword>
<listaddress>
<listaddress>
..
default <approve|discard|reject|skip|none>
log <logfilename|none>
-----------------------------

If you call `listadmin` every configured list is checked for pending
moderation tasks and you will be prefaced with every mail and will be asked
what should happen with the mail.

About this document
-------------------

(c) Alexander Wirt <formorer@grml.org>; HTML version powered by link:http://www.methods.co.nz/asciidoc/[asciidoc].

// vim: ft=asciidoc autoindent textwidth=75 formatoptions=tcqn
