Clone repo, run commands:

`sudo docker build -t symfony . `

`sudo docker run -p 8080:80 -i -t -v /path/to/symfony/in/host:/var/www/html/symfony symfony`

Now access `localhost:8080/symfony` in your browser and you accessed the symfony app.

**Note:** it is important to put your app inside the `/var/www/html/symfony` dir, as automated script will go there to install composer deps for the app 

**Note:** You will have to allow your ip address inside `app_dev.php` if you want to use it.

Tested with [Konkurencia Symfony Bootsrap](https://github.com/konkurencia/symfony-bootstrap) as Symfony application