# Progetto applicazioni web e mobile

## Idea
L'idea iniziale era quella di sviluppare un'applicazione che permettesse di conservare l'elenco dei libri posseduti da un utente, aggiungendo informazioni come una recensione, alcune note o il periodo di lettura.

## Tecnologie Selezionate
I framework che abbiamo scelto di utilizzare sono ASP .NET Core Web API per il backend (utilizzando l'Entity Framework per il Database) e Flutter per lo sviluppo dell'applicazione mobile. La scelta è ricaduta su un framework che permette di sviluppare applicazioni mobile per facilitare al meglio l'inserimento nel sistema di un libro.

Avendo scoperto che ogni libro ha un codice ISBN che permette di identificarlo in modo quasi univoco, abbiamo cercato una piattaforma che permettesse di ottenere automaticamente le informazioni relative a un libro. Così, grazie a uno scanner barcode, un utente ha la possibilità di inserire automaticamente tutte le informazioni di un libro che possiede.

Le informazioni sui libri sono ottenute tramite le API di Google Books mediante le seguenti richieste:
- GET `https://www.googleapis.com/books/v1/volumes?q=isbn:ISBN`
- GET `https://www.googleapis.com/books/v1/volumes/ID`

La ricerca tramite ID è stata obbligata dal fatto che la chiamata tramite ISBN non restituisce sempre informazioni omogenee, tralasciando, a volte, informazioni utili. L'ID, invece, essendo chiave primaria all'interno del database di Google, permette che vengano restituite tutte le informazioni presenti su un determinato libro.

Se necessario, un utente ha anche la possibilità di cercare un libro tramite titolo; ciò è possibile grazie alla chiamata API fornita da Google:
- GET `https://www.googleapis.com/books/v1/volumes?q=TITOLO&maxResult=N`

Una volta che il libro è stato inserito nella propria libreria, l'utente avrà la possibilità di segnalarne lo stato di lettura (Da Comprare/Comprato/Letto/Recensito), inserire una propria valutazione numerica (da 1 a 5 stelle) e scrivere una breve annotazione/recensione per ricordare il libro.
