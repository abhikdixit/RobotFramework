*** Settings ***
Documentation    Suite description
Library     String
*** Test Cases ***
Generate Random Number
    [documentation]  This will generate any rondom number
    ${random_num} =     Generate Random String
    Log to Console      ${random_num}

    #[documentation]  This will generate rondom number with length of 12 char.
    ${ran_num} =     Generate Random String     12
    Log to Console      ${ran_num}

    #[documentation]  This will generate rondom number with length of 12 char in Lower case.
    ${ran_num_lower} =     Generate Random String     12      [LOWER]
    Log to Console      ${ran_num_lower}