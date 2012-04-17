#!/usr/bin/env python2

# Author: Bhavik Shah
# Created: 3/5/09
# Description: Simple script that uses the python imap library
# to retrieve number of messages and unread messages from your 
# imap email account. 

# Script is free. Credit to bhaviksblog.com is appreciated =)

import ConfigParser
import imaplib
import re
import os
import optparse
import sys
import time

def checkMail(username, password, mailbox, mailserver, port, timeout, icon):
    while True:
        try:
            # connect to mail server (uses SSL, port 993)
            server = imaplib.IMAP4_SSL(mailserver,port)

            # gmail uses ssl...if your imap mail server doesn't comment the above
            # line and uncomment this one.
            # server = imaplib.IMAP4(mailserver,port)

            # login with the variables provided up top
            server.login(username,password)

            # select your mailbox
            server.select(mailbox)

            # pull info for that mailbox
            data = str(server.status(mailbox, '(MESSAGES UNSEEN)'))

            unseenMails = int(re.sub(r"^.*UNSEEN ([0-9]*).*$", r"\1", data))
            if unseenMails > 0:
                sys.stdout.write("icon %s\n" % icon)
            else:
                sys.stdout.write("hide")

            # close the mailbox
            server.close()

            # logout of the server
            server.logout()
        except:
            sys.stdout.write("hide")
        sys.stdout.flush()
        time.sleep(timeout)

optionParser = optparse.OptionParser()
optionParser.add_option("-i", "--icon", metavar="ICON", dest="icon",
                        help="Icon file to show", default="%INSTALLDIR%/share/trayIcon/mail/icons/mail-icon.png")
optionParser.add_option("-t", "--timeout", metavar="SLEEP", dest="timeout",
                        help="Timeout between mail checks", type=int, default=60)
(options, _) = optionParser.parse_args()

# In a future we probably support several accounts. But not right now
config = ConfigParser.ConfigParser()
config.read(os.environ["HOME"] + "/.imapTray")

for s in config.sections():
    try:
        username = config.get(s, "username")
        password = config.get(s, "password")
        mailbox = config.get(s, "mailbox", False, {"mailbox": "INBOX"})
        mailserver = config.get(s, "mailserver")
        port = config.get(s, "port")
    except ConfigParser.NoOptionError as ex:
        print ex
        continue

checkMail(username, password, mailbox, mailserver, port, options.timeout, options.icon)
