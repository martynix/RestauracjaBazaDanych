# Projekt konceptualny

Celem projektu jest sporządzenie projektu bazy danych dla Sieci Restauracji zawierającej dane 
o placówkach, pracownikach, rezerwacjach, klientach, zamówieniach, potrawach, składnikach, 
stanach magazynów, dostawach itp.

Restauracje – tabela zawierająca dane o istniejących w sieci restauracjach oraz ich adresach
Manager – tabela zawierająca dane (imię i nazwisko, adres zamieszkania, numer kontaktowy)
menegerów, jeden meneger jest przydzielony i zarządza jedną konkretną restauracją
Pracownicy – tabela zawiera dane o pracownikach sieci restauracji (imię i nazwisko, adres 
zamieszkania, numer kontaktowy)
Kucharze – tabela zawiera dane o szczególnym typie pracowników czyli kucharzach
Zmiana – zmiana jest to tabela zawierająca informację o konkretnej zmianie pracującej w 
restauracji w konketnym dniu i godzinach; do zmiany należy kilku pracowników i jeden lub 
więcej kucharzy
Stoliki – tabela zawiera informacje o możliwych konfiguracjach stolików w restauracji i liczbie 
osób, którą dany stolik będzie w stanie pomieścić
Magazyn – tabela zawiera informacje o stania magazynu (ilości składników jakie się w nim 
znajdują) oraz jego lokalizacji (lokalizacja magazynu będzie taka sama jak restauracji do której 
on należy)
Klient - zawiera informacje o klientach (imię i nazwisko, adres zamieszkania, numer 
kontaktowy)
Rezerwacje – tabela zawiera informacje o złożonych przez klientów rezerwacjach
Zamówienia - tabela zawiera informacje o zamówieniach złożonych przez klienta
Paragon – zawiera informacje o paragonie do zamówienia – ilość zawartych rzeczy, koszt 
poszczególnych składników oraz całego zamówienia
Menu – zawiera menu restauracji
Danie – zawiera informacje o daniu – gramatura, alergeny
Przepisy – tabela zawiera dane o przepisach na dania
Zamówienia na składniki - tabela zawiera informacje o zamówionej liczbie składników do 
magazynu danej restauracji

# Scenariusze użycia
![Scenariusze użycia](https://user-images.githubusercontent.com/112055662/221262760-87e98adb-2125-4152-8da4-360b53611045.png)

# Projekt logiczny
##Model relacyjny przed normalizacją
![](https://user-images.githubusercontent.com/112055662/221263008-ee5b8cf2-7d4b-44c9-891f-c168300059dd.png)

## Normalizacja
Każda tabela została poddana normalizacji. Przebieg normalizacji wszystkich tabel znajduje się w sekcji _Issues_.
![](https://user-images.githubusercontent.com/112055662/221266396-71e4e99a-16fe-4937-b177-e1d2ac8d2150.png)


## Model relacyjny po normalizacji
![](https://user-images.githubusercontent.com/112055662/221263997-3097bd0d-c749-4361-b6fe-780c97807401.png)

W celu analizy danych wprowadzonych do bazy, sporządzono 15 kwerend, w tym: wybierające, zliczające, sortujące i wyszukujące.

A university project made by /martynix , /abeestungme & /RakoczyKrzysztof .
