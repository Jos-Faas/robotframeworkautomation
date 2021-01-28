*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LANDING_NAVIGATION_ELEMENT} =  css=h1[class='logo']
${LANDING_IMAGE_ELEMENT} =    css=div[class='content'] img
${LANDING_LINKLIJSTEN_ELEMENT} =    css=div[class='cb']
${LANDING_LINKLIJSTEN_HEADER} =    css=div[class='cb__header'] >h2
${LANDING_LINKLIJST_OMSCHRIJVING} =    css=h3[class=mb-5]
${LANDING_LINKLIJST_TITLE} =    css=div[class='list-group'] >h3
${LANDING_LINKLIJST_LINKS} =    css=div[class='mb-3'] >a


*** Keywords ***
Navigeer En Verifieer Dat Pagina Geladen Is
    navigeer naar
    verifieer dat pagina geladen is

Navigeer Naar
    go to  ${URL_HOME_DICT.${ENVIRONMENT}}

Verifieer Dat Pagina Geladen Is
    wait until page contains element  ${LANDING_NAVIGATION_ELEMENT}

Controleer Dat We Op De Homepagina Goed Zijn
    [Arguments]    ${naam_site}
    ${logoGoed} =    get text    ${LANDING_NAVIGATION_ELEMENT}
    LOG    ${logoGoed}
    LOG    ${naam_site}
    element text should be    ${LANDING_NAVIGATION_ELEMENT}    ${naam_site}

Controleer Dat Er Een Image Aanwezig Is
    page should contain image    ${LANDING_IMAGE_ELEMENT}

Verifieer Dat Er Linklijsten Aanwezig Zijn
    [Arguments]    ${verwacht_aantal_linklijsten}
    ${linklijsten_aantal} =    get element count    ${LANDING_LINKLIJSTEN_ELEMENT}
    LOG    ${linklijsten_aantal}
    LOG    ${verwacht_aantal_linklijsten}
    should be true    ${linklijsten_aantal} == ${verwacht_aantal_linklijsten}

Verifieer Dat De Elementen In De Linklijst Juist Zijn
    [Arguments]    ${naam_element_linklijst}    ${element_linklijst}    ${verwacht_werkinstructies_linklijst}    ${verwacht_aantal_linklijsten}
    @{list_linklijst} =    Get WebElements    ${element_linklijst}
    ${List_linklijst_aantal} =    get element count      ${element_linklijst}
    ${return_vergelijk_linklijst_totaal} =    Set Variable    ${0}
    #@{Verwacht_linklijst_naam} =  Create List    ${verwacht_werkinstructies_linklijst}

    log    Dit is het element welke we controleren: ${element_linklijst}
    log    Controle van de juiste elementen op de pagina: ${naam_element_linklijst}
    log    De list van elementen op de webpagina is: ${List_linklijst_aantal}
    log    De verwachte aantal elementen op de webpagina is: ${verwacht_aantal_linklijsten}
    log many    De list van verwachte elementen = ${verwacht_werkinstructies_linklijst}

    ${return_linklijst_boolean} =    run keyword if    '${List_linklijst_aantal}' == '${verwacht_aantal_linklijsten}'    Linklijst_gelijk    ${List_linklijst_aantal}    ${verwacht_aantal_linklijsten}
    ...  ELSE  Linklijst_ongelijk

    should be true    ${return_linklijst_boolean}

    FOR    ${list_element_linklijst}    IN    @{list_linklijst}
        ${list_element_linklijst_text} =    get text    ${list_element_linklijst}
        Log    Dit is item ${list_element_linklijst_text}
        ${return_vergelijk_linklijst} =    Vergelijk_linklijsten_titels    ${list_element_linklijst_text}    ${verwacht_werkinstructies_linklijst}
        should be true    ${return_vergelijk_linklijst}
        run keyword if    '${naam_element_linklijst}' == 'Klik op proceslink'    Klik Op Link in Linklijst    ${list_element_linklijst}
        log    Hierbij de totale waarde: ${return_vergelijk_linklijst_totaal}
        ${return_vergelijk_linklijst_totaal} =    Set Variable    ${return_vergelijk_linklijst_totaal + 1}
        log    Hierbij de return waarde: ${return_vergelijk_linklijst}
        log    Hierbij de totale waarde na optellen +1 : ${return_vergelijk_linklijst_totaal}
        exit for loop if    ${return_vergelijk_linklijst_totaal} == ${verwacht_aantal_linklijsten}
    END

    log    Uit de loop gegaan omdat het aantal returned gelijk is aan het verwachte aantal.

Linklijst_gelijk
    [Arguments]    ${List_linklijst_header_aantal}    ${verwacht_aantal_linklijsten}
    log    Het verwachte aantal linklijsten ${verwacht_aantal_linklijsten} is gelijk aan de linklijsten op de pagina ${List_linklijst_header_aantal}
    ${linklijst_boolean}    Set Variable     ${True}
    [Return]    ${linklijst_boolean}


Vergelijk_linklijsten_titels
    [Arguments]    ${list_element_linklijst_text}    ${verwacht_werkinstructies_linklijst}
    ${index} =    Set Variable    ${0}
    FOR    ${list_verwacht_linklijst}    IN    @{verwacht_werkinstructies_linklijst}
        log    Dit is het verwachte item ${list_verwacht_linklijst} en dit is het gevonden item ${list_element_linklijst_text}
        return from keyword if    """${list_verwacht_linklijst}""" == """${list_element_linklijst_text}"""    ${1}
        ${index} =    Set Variable    ${index + 1}
        log    Dit is de waarde van index: ${index}
    END


Linklijst_ongelijk
    log    niet OK
    ${linklijst_boolean}    Set Variable     ${False}
    [Return]    ${linklijst_boolean}

Klik Op Link in Linklijst
    [Arguments]    ${list_element_linklijst}
    click button    ${list_element_linklijst}
    exit for loop