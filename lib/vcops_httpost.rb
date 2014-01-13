
require 'net/https'

module VcopsHttpost

  def self.connect (vars)
    http = Net::HTTP.new(vars[:host], 443)
    http.use_ssl = true
    http.verify_mode = vars[:verify_mode] unless vars[:verify_mode].nil?
    http.start do |http|
      req = Net::HTTP::Get.new('/HttpPostAdapter/OpenAPIServlet')
      req.basic_auth vars[:username], vars[:password]
      resp, data = http.request(req)

      return resp
    end
  end

  def self.http_post (vars)
    http = Net::HTTP.new(vars[:host], 443)
    http.use_ssl = true
    http.verify_mode = vars[:verify_mode] unless vars[:verify_mode].nil?
    http.start do |http|
      req = Net::HTTP::Post.new('/HttpPostAdapter/OpenAPIServlet')
      raise ArgumentError, 'missing POST BODY' if vars[:body].nil?
      req.body = vars[:body]
      req.basic_auth vars[:username], vars[:password]
      resp, data = http.request(req)

      return resp
    end
  end

  def self.http_post_add_gmo(config,fl,sl)
    #https://vcops/HttpPostAdapter/OpenAPIServlet
    first_line = "#{fl[:resource_name]},#{fl[:adapter_kind_key]},#{fl[:resource_kind_key]},#{fl[:identifiers]},#{fl[:resource_description]},#{fl[:monitoring_interval]},#{fl[:store_only]},#{fl[:source_adapter]},#{fl[:disable_resource_creation]},#{fl[:disable_resource_creation]}"
    second_line = "#{sl[:metric_name]},#{sl[:alarm_level]},#{sl[:alarm_message]},#{sl[:date]},#{sl[:value]},#{sl[:threshold_high]},#{sl[:threshold_low]}"

    config[:body] = "#{first_line}\r\n#{second_line}"
    print "#{config[:body]}\n\n"

    resp = VcopsHttpost.http_post(config)
    raise StandardError, "'Complete' response not found, failed POST." unless resp.instance_variable_get(:@header).to_s.match("Complete").nil?
    print resp.instance_variable_get(:@body)
    return resp
  end



end
