# AUTH: codenvibes
# DESC: A puppet manifest that configures SSH client settings

file_line { 'Turn off password auth':
  path   => '/etc/ssh/sshd_config',
  line   => 'PasswordAuthentication no',
}

file_line { 'Declare identity file':
  path   => '/etc/ssh/ssh_config',
  line   => 'IdentityFile ~/.ssh/school',
}
