require 'multi_json'
require 'faraday'
require 'elasticsearch/api'

class ESClient
  include Elasticsearch::API
  ELASTICSEARCH_ENDPOINT = 'http://localhost:9200'
  CONNECTION = ::Faraday::Connection.new url: ELASTICSEARCH_ENDPOINT

  def perform_request(method, path, params, body)
    puts "--> #{method.upcase} #{path} #{params} #{body}"

    CONNECTION.run_request \
      method.downcase.to_sym,
      path,
      ( body ? MultiJson.dump(body): nil ),
      {'Content-Type' => 'application/json'}
  end
end
