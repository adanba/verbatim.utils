################ Info pour le développement
## Cette fonction prend un vecteur de chaine de caractères en entrée (i.e. un vecteur de verbatims)
## Cette fonction renvoie un vecteur de chaine de caractères de même longueur

## Cette fonction utilisera Freeling
## lemmatisation(c("une Phrase avec une forme féminine et un verbe conjugué","Une phrase avec un mot inconnu xxsf"), lang="fr")
## doit renvoyer
## c("un Phrase avec un forme féminin et un verbe conjuguer","Un phrase avec un mot inconnu xxsf")

## > Penser au fait que la fonction doit être Cross Platform
## > Penser aux performance (la fonction doit être rapide sur de longs et nombreux verbatims)

## Taux de développement estimé : 1 %
## Next steps : Adapter le code échangé par mail avec Abdelhadi
## (car la fonction initial renvoyait un evecteur de longeur différentes du vecteur en entrée)
####################################################


#' @export lemmatisation
lemmatisation  <- function(txt, lang="en") {
  lang <- match.arg(tolower(lang), c("en", "fr"))

  library(magrittr)

  ## Need Freeling to be installed


  ## Nom de fichier source
  txt_in_name <- tempfile()

  ## Le fichier source
  txt_in<-file(txt_in_name,encoding="UTF-8")
  writeLines(txt,txt_in)
  close(txt_in)

  ## Nom de fichier en sortie
  txt_out_name <- tempfile()

  ## Le fichier en sortie
  txt_out<-file(txt_out_name,encoding="UTF-8")



  ## Check the OS type: Car l'appel de freeling diffère selon les OS
  if(.Platform$OS.type == "unix") {
    ## Écriture de la commande
    command <- paste0("analyze -f ",lang,".cfg <",txt_in_name," >",txt_out_name)
    ## Exécution de la commande
    res <- system(command)
  } else {

  }

  ## S'il y a eu un problème on renvoi NULL
  if(res!=0) return(NULL)

  ## On lit le fichier en sortie
  out <- readLines(testtxt_out_name,encoding="UTF-8")

  ## On regarde le résultat
  return(out)

}
