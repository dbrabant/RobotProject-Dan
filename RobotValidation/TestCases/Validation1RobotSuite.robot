*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${url}=    https://opensource-demo.orangehrmlive.com/index.php/auth/login
${url_salesforce}=    https://login.salesforce.com/
${browser}=    gc

*** Test Cases ***
TC_001_TextValidation
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
    Input Text    id=txtUsername    Admin    
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin    
    
    #Page Should Contain    Dashboard    
    Page Should Not Contain    Dashboard1    
    
    Click Element    id=welcome       
    Sleep    4s   
    Click Link    link=Logout   
    
    Close Browser
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
    Input Text    id=txtUsername    Admin    
    Input Password    id=txtPassword    admin123
    Click Button    id=btnLogin    
    
    #Page Should Contain    Dashboard    
    Page Should Not Contain    Dashboard1    
    
    Click Element    id=welcome       
    Sleep    4s   
    Click Link    link=Logout   
    
    Close Browser
    
TC_002_TextFieldValidation
    Open Browser   ${url}    ${browser}
    Maximize Browser Window
       
    Page Should Contain Textfield    id=txtUsername    
    Input Text    id=txtUsername    Admin    
    
    Page Should Contain Textfield    id=txtUsername
    #Page Should Not Contain Textfield    id=txtUsername1
    Input Password    id=txtPassword    admin123
    
    Page Should Contain Button    id=btnLogin   
    Click Button    id=btnLogin     
    
    Click Element    id=welcome       
    Sleep    4s   
    Click Link    link=Logout   
    
    Close Browser
    
TC_003_CheckBoxValidation
    Open Browser   ${url_salesforce}    ${browser}
    Maximize Browser Window
    Click Element    id=rememberUn 
    Checkbox Should Be Selected    id=rememberUn   
    Sleep    3s
    
    Click Element    id=rememberUn 
    Checkbox Should Not Be Selected    id=rememberUn
    Sleep    3s
    
    Close Browser
    
TC_004_ResultTextValidation
    Open Browser   ${url_salesforce}    ${browser}
    Maximize Browser Window
    
    Input Text    id=username    Thomas    
    Input Password    id=password    Odyle
    Click Button    id=Login 
    
    Sleep    4s
    #Element Text Should Be    id=error    Vérifiez votre nom d'utilisateur et votre mot de passe. Si vous ne parvenez toujours pas à vous connecter, contactez votre administrateur Salesforce.   
    #Element Should Contain    id=error    Vérifiez votre nom
    Element Should Not Contain    id=error    Vérifiez votre nom
    Close Browser   
    
 TC_005_ElementValidation
    Open Browser   ${url_salesforce}    ${browser}
    Maximize Browser Window
    
    Title Should Be    Connexion | Salesforce    
    
    Element Should Be Enabled    id=username
    #Element Should Be Disabled     id=username   
    
    Element Should Be Visible    id=username      
    Element Should Not Be Visible    id=error    
    
    Close Browser   


