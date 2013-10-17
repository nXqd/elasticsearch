require_dependency 'es_client'

module Elasticable
  module ClassMethods
    # example of usage
    # Model.es_find
    def es_find(params={})
      client = ESClient.new

      begin
        result = Oj.load(client.get index: ES_INDEX, type: self.name.downcase, id: params[:id])
      rescue Exception
        return nil
      end

      return nil unless result["exists"]
      puts result["exists"]
      result["_source"]
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
