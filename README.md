# ABAP How To Transliterate Polish Text
Sometimes, it is necessary to transliterate some text - replace special symbols with their Unicode analogs. For example, in some situations, we have to replace the character ą in Polish with the character a. 

Overall, in Polish, we have 18 symbols (9 in lowercase and 9 in uppercase), which we have to replace. So, we can easily replace all such characters in a text using the approach below.

### Possible use cases.
* Transliterating other Eastern European languages.
* Replacing any symbols with any symbols in your text. 

### Important. 
Using this approach makes sence only when using regular expressions is impossible.

### Example

* Input:  Szkoła Podstawowa Nr 29 im. Synów Pułku Zespół Szkół Ogólnokształcących Mistrzostwa Sportowego Nr 2 w Białymstoku
* Output: Szkola Podstawowa Nr 29 im. Synow Pulku Zespol Szkol Ogolnoksztalcacych Mistrzostwa Sportowego Nr 2 w Bialymstoku
