# connect to a server without typing a password.
# Requirements:
#     Your SSH client configuration must be configured to use the private key ~/.ssh/holberton
#     Your SSH client configuration must be configured to refuse to authenticate using a password

exec { 'echo "PasswordAuthentication no\nIdentityFile ~/.ssh/holberton" >> /etc/ssh/ssh_config':
        path    => '/bin/'
}
