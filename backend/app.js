
const express = require('express');
var cors = require('cors');
const app = express();
const port = 3000;
const axios = require('axios');
const iconv = require('iconv-lite');
app.use(express.json());

app.use(cors());

var libri = [];
app.get("/api/v0/libro/:isbn", (req, res) => {
    console.log("a");
    let isbn = req.params.isbn;
    let url = `https://www.googleapis.com/books/v1/volumes?q=isbn:${isbn}`;

    axios.get(url)
        .then(response => {
            res.send(response.data);
        })
        .catch(error => {
            res.send(error);
        });
});

app.post("/api/v0/libro", (req, res) => {
    console.log(req.body);
    var isbn = req.body.isbn;
    var url = `https://www.googleapis.com/books/v1/volumes?q=isbn:${isbn}`;

    axios.get(url)
        .then(response => {
            libri.push(response.data);
            res.send(response.data.items[0].volumeInfo.title);
        })
        .catch(error => {
            res.send(error);
        });
});

app.get("/api/v0/libri", (req, res) => {
    res.send(libri);
    //only fot test purpose TODO: remove
    libri.forEach(element => {
        console.log(element.items[0].volumeInfo.title);
    });
});


app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})