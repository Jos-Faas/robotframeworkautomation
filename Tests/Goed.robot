*** Settings ***
Documentation  Dit is de robot file voor de testcases van de Goed website
Resource  ../Resources/GoedApp.robot
Resource  ../Resources/CommonWeb.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

# robot -d results tests/Goed.robot
# robot -d results -t "Werkinstructies homepagina" tests/Goed.robot    om testcases apart uit te voeren
# robot -d results -i "smoke" tests/Goed.robot    om Tags uit te voeren

*** Variables ***
${ENVIRONMENT} =    prod
${BROWSER} =  chrome
${URL_HOME} =  https://www.goed.be/nl/
&{URL_HOME_DICT}    prod=https://www.goed.be/nl/    dev=https://www.dev.goed.be/nl/

*** Test Cases ***
Goed homepagina
    [Documentation]  Dit is de test of de homepagina van de website van Goed werkt en het logo aanwezig is
    [Tags]    smoke
    GoedApp.Ga Naar Homepagina   Goed
    #GoedApp.Verifieer dat alle elementen aanwezig zijn
    #GoedApp.Verifieer dat alle top elementen aanwezig zijn