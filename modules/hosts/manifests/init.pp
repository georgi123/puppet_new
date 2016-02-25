# Base hosts entries needed for all servers
class hosts {
  host { 'localhost':
    ip => '127.0.0.1',
  }
}

