#bin/bash 

# Demander à l'utilisateur de saisir une URL

read -p "Entrez l'URL du site à vérifier (ex: https://example.com) : " URL

# Vérifie que l'URL n'est pas vide
if [ -z "$URL" ]; then
  echo "Erreur : vous devez entrer une URL."
  exit 1
fi

# Effectuer une requête HTTP HEAD silencieuse avec un timeout de 5 secondes
HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" --max-time 5 "$URL")

# Vérifie si le code HTTP est 200
if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "✅ Le site $URL est DISPONIBLE (HTTP $HTTP_STATUS)."
else
  echo "❌ Le site $URL est INDISPONIBLE (HTTP $HTTP_STATUS)."
fi


