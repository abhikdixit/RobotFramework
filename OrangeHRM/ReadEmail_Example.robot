*** Settings ***
Library    ImapLibrary2

*** Test Cases ***
Email Verification
    Open Mailbox    host=imap.gmail.com    user=vishal.leo.kumar@gmail.com    password=ukxzrbaoyvrykuub
    ${LATEST} =    wait for email    sender=abhinay.dixit@hotmail.com    timeout=300
    ${parts} =  walk multipart email    ${LATEST}
    FOR     ${i}    IN RANGE    ${parts}
         Walk Multipart Email   ${LATEST}
         ${ctype} =     get multipart content type
         Continue For Loop If   '${ctype}' != 'text/html'
         ${payload} =   get multipart payload   decode=True
         Should Contain     ${payload}  Robot Framework is a generic open source automation framework
         ${HTML} =      open link from email     ${LATEST}
         Should Contain     ${HTML}     robotframework
    END

    Close Mailbox