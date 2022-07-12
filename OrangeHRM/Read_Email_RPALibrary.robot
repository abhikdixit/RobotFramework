*** Settings ***
Library     RPA.Email.ImapSmtp   smtp_server=smtp.gmail.com  smtp_port=587
Suite Setup  Authorize  account=${GMAIL_ACCOUNT}  password=${GMAIL_PASSWORD}

*** Variables ***
${GMAIL_ACCOUNT}        vishal.leo.kumar@gmail.com
${GMAIL_PASSWORD}       ukxzrbaoyvrykuub
${RECIPIENT_ADDRESS}    abhinay.dixit@hotmail.com
${BODY_IMG1}            ./Image/File1.png
${BODY_IMG2}           ./Image/File2.png
${EMAIL_BODY}     <h1>Heading</h1><p>Status: <img src='File1.png' alt='approved image'/></p>
...               <p>INVOICE: <img src='File2.png' alt='invoice image'/></p>

*** Tasks ***
Sending email
    Send Message  sender=${GMAIL_ACCOUNT}
    ...           recipients=${RECIPIENT_ADDRESS}
    ...           subject=Message from RPA Robot
    ...           body=RPA Robot message body

Sending HTML Email With Image
    [Documentation]     Sending email with HTML content and attachment
    Send Message
    ...                 sender=${GMAIL_ACCOUNT}
    ...                 recipients=${RECIPIENT_ADDRESS}
    ...                 subject=HTML email with body images (2) plus one attachment
    ...                 body=${EMAIL_BODY}
    ...                 html=${TRUE}
    ...                 images=${BODY_IMG1}, ${BODY_IMG2}
    ...                 attachments=./Image/File1.png

# Need to install "access-outlook-email"