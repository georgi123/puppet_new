# Additional hosts entries for other nodes
class hosts::other {
  # Additional nodes
  host { 'hyperlane.gfk.com':
    ip => '195.238.163.133',
  }

  host { 'hyperlane-staging.gfk.com':
    ip => '195.238.163.134',
  }

  host { 'visualizer.gfk.com':
    ip => '195.238.163.135',
  }

  host { 'gxl-jr.gfk.com':
    ip => '195.238.163.136',
  }

  host { 'gxl-ssd-test.gfk.com':
    ip => '195.238.163.138',
  }

  host { 'dimsvc.gfk.com':
    ip => '195.238.163.137',
  }

  host { 'gxl-grafana.gfk.com':
    ip => '172.25.48.73',
  }
}

