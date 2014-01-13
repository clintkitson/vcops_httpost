require 'vcops_httpost'

config = {:host=>"vcops", :username=>'admin',
          :password=>'password', :verify_mode=>OpenSSL::SSL::VERIFY_NONE}

#resp = VcopsHttpost.connect(config)
#cookie = resp.instance_variable_get(:@header)["set-cookie"][0].to_s.split('; ')[0]
#config[:cookie] = cookie

fl = {:resource_name=> 'TEST',:adapter_kind_key=>'ruby_httpost',:resource_kind_key=>'ruby_httpost',
      :identifiers=> 'ident1::ident1Value', :resource_description=> 'no description', :monitoring_interval=> 5,
      :store_only=> 'false',:source_adapter=> 'Http Post',:disable_resource_creation=> 'false'}
sl = {:metric_name=> 'metric1',:alarm_level=> '0',:alarm_message=> 'none',:date=> (Time.now.to_f * 1000).to_i,
      :value=> 1,:threshold_high=> '',:threshold_low=> ''}

resp = VcopsHttpost.http_post_add_gmo(config,fl,sl)
