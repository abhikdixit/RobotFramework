*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Drag and Drop Functionality

    Open Browser	https://jqueryui.com/resources/demos/droppable/default.html	    ff
    Maximize Browser Window
    # item is my source and Cart is my destination
    #file which you want to attach is your source and mail is your destination
    Drag And Drop	id=draggable	id=droppable
    Sleep	5s
    Close Browser