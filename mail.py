import smtplib

fromaddr = 'rawat.rishi00@gmail.com'
toaddrs  = 'rawat.rishi@gmail.com'
msg = 'There was a terrible error that occured and I wanted you to know!'


# Credentials (if needed)
username = 'rawat.rishi00'
password = '9981429566@#'

# The actual mail send
server = smtplib.SMTP('smtp.gmail.com:587')
server.starttls()
server.login(username,password)
server.sendmail(fromaddr, toaddrs, msg)
print "suessfully send"
server.quit()
