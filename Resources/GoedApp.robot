*** Settings ***
Resource  ./PO/Landing.robot
#Resource  ./PO/TopNav.robot
#Resource  ./PO/Proces.robot

*** Variables ***
@{LINKLIJST_HEADER}    Werkinstructies    Externe Links werkinstructies
@{LINKLIJST_OMSCHRIJVING}    Instructie voor het werken met Tool    Dit zijn externe links
@{LINKLIJST_LINKS_TITEL}    Processen    Externe links
@{LINKLIJST_LINKS_WERKINSTRUCTIES}    Navigatie    Schema    Pagina    Multimedia
@{LINKLIJST_LINKS_EXTERNE}    Intranet    Jira
@{LINKLIJST_LINKS}    @{LINKLIJST_LINKS_WERKINSTRUCTIES}    @{LINKLIJST_LINKS_EXTERNE}
@{LINKLIJST_PROCESSEN_NAV_LINKS}    Navigatie    Schema's    Pagina    Multimedia    Alle Stappen
@{LINKLIJST_TAAK_NAVIGATIE}    Toevoegen proces-taak    Toevoegen subtaak pagina's    Publiceren navigatie
${PROCES_INTRODUCTIE_TITEL}    Navigatie - procesniveau
@{PROCES_INTRODUCTIE_TEXT}    Deze pagina staat op het 'proces' niveau. Op dit niveau kan een content pagina worden aangemaakt, of een redirect pagina worden geplaatst naar een (sub)taak pagina.    Merk op dat deze pagina NIET als taak pagina wordt getoond in de navigatie hierboven. Er is geen blauw blokje dat oplicht.  Kies in de taaknavigatie waar je meer informatie over wilt krijgen.

*** Keywords ***
Ga Naar Homepagina
    [Arguments]   ${naam_site}
    Landing.Navigeer En Verifieer Dat Pagina Geladen Is
    Landing.Controleer Dat We Op De Homepagina Goed Zijn    ${naam_site}

#Verifieer dat alle elementen aanwezig zijn
#    Landing.Controleer Dat Er Een Image Aanwezig Is
#    Landing.Verifieer Dat Er Linklijsten Aanwezig Zijn   2
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    Header    ${LANDING_LINKLIJSTEN_HEADER}    ${LINKLIJST_HEADER}    2
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    Omschrijving    ${LANDING_LINKLIJST_OMSCHRIJVING}    ${LINKLIJST_OMSCHRIJVING}    2
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    Titel linklijst    ${LANDING_LINKLIJST_TITLE}    ${LINKLIJST_LINKS_TITEL}    2
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    Links    ${LANDING_LINKLIJST_LINKS}    ${LINKLIJST_LINKS}    6
#
#Verifieer dat alle top elementen aanwezig zijn
#    TopNav.Home Knop Is Aanwezig En Heeft Juiste URL    Home
#    TopNav.Processen Knop Is Aanwezig en is ingeklapt
#    TopNav.Klik Op Processen Knop Om Uit Te Klappen
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    TopNav Processen    ${TOP_NAV_PROCES_NAV_LINK}     ${LINKLIJST_PROCESSEN_NAV_LINKS}    5
#    TopNav.Zoeken Op Pagina Is Aanwezig
#
#Klik Op Pagina In linklijst Om Naar De Procespagina Te Gaan
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    Klik op proceslink    ${LANDING_LINKLIJST_LINKS}    ${LINKLIJST_LINKS}    6
#    Landing.Verifieer Dat Pagina Geladen Is
#
#Verifieer dat alle proces elementen aanwezig zijn
#    Landing.Verifieer Dat De Elementen In De Linklijst Juist Zijn    Taak linklijst    ${TOP_NAV_TAAK_NAV_LINK}    ${LINKLIJST_TAAK_NAVIGATIE}    3
#    Proces.Verifieer Text In Stap Of Introductie    Intro text    ${PROCES_INTRO_TEKST}     ${PROCES_INTRODUCTIE_TEXT}    5
