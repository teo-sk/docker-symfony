Clone repo, run commands:

`sudo docker build -t symfony . `
`sudo docker run -p 8080:80 -i -t -v /path/to/symfony/in/host:/var/www/html/symfony symfony`

Now access `localhost:8080/symfony` in your browser and you accessed the symfony app.

**NOTE** It won't work yet because app_dev, permissions, composer deps not installed

**TODO** Make it work.


