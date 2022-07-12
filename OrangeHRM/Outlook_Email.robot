*** Settings ***
Library                 RPA.Outlook.Application
Suite Setup             Open Application
Suite Teardown          Quit Application

*** Variables ***
${RECIPIENT}            abhinay.dixit@hotmail.com

*** Tasks ***
Send message
    Send Message         recipients=${RECIPIENT}
    ...                subject=This is the subject
    ...                body=This is the message body
    ...                attachments=resources.html