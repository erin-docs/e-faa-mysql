# Readme Localization Notes

Example query: [https://docsexamples.dev.looker.com/explore/e_faa_mysql/flights?toggle=fil&qid=dwS6VKUFc7cNFJnItlKKCc](https://docsexamples.dev.looker.com/explore/e_faa_mysql/flights?toggle=fil&qid=dwS6VKUFc7cNFJnItlKKCc)

Sudo as this user to see the "espanol" version: [https://docsexamples.dev.looker.com/admin/users/80/edit](https://docsexamples.dev.looker.com/admin/users/80/edit)


The JSON strings files don't allow comments, so here are my notes about how model localization is set up for this project:

## Comments from es.strings file

// "location" = "Location"; <-- In the localization Docs, I use location as an example of something that doesn't have a label and so isn't localized
// "country" = "Country"; <-- In our localization docs, I use this as an example of something that isn't defined in the default strings file and so doesn't get localized
"country" = "Country";


// "Number of Engines" = "Number of Engines English";
// "publication" = "Publication";
// "Group Label for DGroup" = "Group Label for DGroup in English";
// "Just Label" = "Just Label English";


## Comments from es-MX strings file

// "location" : "Destino", <-- In the localization Docs, I use location as an example of something that doesn't have a label and so isn't localized
