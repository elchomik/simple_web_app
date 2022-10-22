# simple_web_app
This is simple web_app which I used to create docker image on docker hub. 
Aplikacja Simple_web_app

Budowanie obrazu: **docker build -t <nazwa_budowanego_obrazu> -f Dockerfile <lokazlizacja_pliku_dockerfile>**
Wypchnięcie obrazu do repozytirum docker_hub:
					     **docker login -u <nazwa_konta_docker_hub> **
					     **docker image push <nazwa_konta_docker_hub>/<nazwa_wypychanego_obrazu>**
Uruchomienie obrazu dockera: **docker run -d -p <nazwa_portu>:8080 <nazwa_użytkownika_docker_hub>/<nazwa_obrazu_docker_hub>**


#Uwagi
W przypadku gdy nie można połączyć się z docker hub:
komenda: **winpty docker login -u <nazwa_konta_docker_hub>**
