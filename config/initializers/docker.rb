cert_path = File.expand_path ENV['DOCKER_CERT_PATH']
Docker.options = {
client_cert: File.join(cert_path, 'cert.pem'),
client_key: File.join(cert_path, 'key.pem'),
ssl_ca_file: File.join(cert_path, 'ca.pem'),
scheme: 'https'
}
