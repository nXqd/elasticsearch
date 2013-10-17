require_dependency 'es_client'

module Elasticable
  module ClassMethods
    def es_find(params={})
      client = ESClient.new

      result = Oj.load(client.get index: ES_INDEX, type: 'books', id: params[:id])

      return nil unless result["exists"]
      puts result["exists"]
      result["_source"]
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
