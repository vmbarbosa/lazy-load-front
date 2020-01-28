const PROXY_CONFIG = {
  '/': {
    'target': process.env.API_SERVER,
    'secure': false
  }
};

module.exports = PROXY_CONFIG;
