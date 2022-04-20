*** Settings ***
Library    SeleniumLibrary 

Suite Setup    Log    I am inside Test Suite Setup
Suite teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log     I am inside test Teardown     

Default Tags    sanity  

*** Test Cases ***
MyFirstTest
     [Tags]    smoke
    Log    Hello World.... 
   
     
    
FirstSeleniumTest
    Set Tags    regression1 
   # remove tags    regression1
      Open Browser    https://google.com    chrome   
      Set Browser Implicit wait  5
      Input Text       name=q        Automation step by step
      Press Keys        name=q       ENTER
       #  Click Button    name=btnk    
      Sleep                2
      Close Browser
      Log             Test completed
      
SampleLoginTest
    [Documentation]    This is a sample login test
  Open Browser    https://opensource-demo.orangehrmlive.com/    chrome
  Set Browser Implicit Wait    5
  Input Text    id=txtUsername    Admin
  Input Password    id=txtPassword    admin123
  Click Button    id=btnLogin
  Click Element    id=welcome
  Click Element    link=Logout
  Sleep    2
  Close Browser
  Log                Test completed    
      
SampleLoginTestWithVariables
    [Documentation]    this is a sample login test with variables.
    Open Browser     ${URL}     chrome
    Set Browser Implicit Wait    5
    Input Text    id=txtUsername    &{LOGINDATA}[username]             
    Input Password    id=txtPassword    ${CREDENTIALS}[1]
    Click Button    id=btnLogin
    Click Element    id=welcome
    Click Element    link=Logout
    Sleep    2
    Close Browser
    Log             Test completed with variables.
    Log             This test was executed by %{username} on %{os}
    
SampleLoginTestWithKeyword
    [Documentation]    this is a sample login test with variables.
    Open Browser     ${URL}     chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element    id=welcome
    Click Element    link=Logout
    Sleep    2
    Close Browser
    Log             Test completed with variables.
    Log             This test was executed by %{username} on %{os}
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}      username=Admin    password=admin123 

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    &{LOGINDATA}[username]             
    Input Password    id=txtPassword    ${CREDENTIALS}[1]
    Click Button    id=btnLogin
    



    