require_relative 'spec_helper'

describe OXMLRPC::Parser do
  it 'should parse simple request with <int> value' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><int>41</int></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [41]
  end  
  
  it 'should parse simple request with <i4> value' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><i4>41</i4></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [41]
  end  
  
  it 'should parse simple request with <string> value' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><string>41</string></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq ["41"]
  end  
  
  it 'should parse simple request with <empty> value' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value>41</value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq ["41"]
  end  

  it 'should parse simple request with <int> values' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><int>41</int></value>
              </param>
              <param>
                <value><int>99</int></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [41,99]
  end  
  
  it 'should parse simple request with <bool> values' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><boolean>0</boolean></value>
              </param>
              <param>
                <value><boolean>1</boolean></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [false,true]
  end  
  
  it 'should parse simple request with <double> values' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><double>-12.214</double></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [-12.214]
  end  
  
  it 'should parse simple request with <dateTime> values' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value><dateTime.iso8601>19980717T14:08:55</dateTime.iso8601></value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [Time.parse("19980717T14:08:55")]
  end  
  
  it 'should parse simple request with <array> values' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value>
                  <array>
                    <data>
                      <value><int>12</int></value>
                      <value><string>Egypt</string></value>
                      <value><boolean>0</boolean></value>
                      <value><i4>-31</i4></value>
                    </data>
                  </array>
                </value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [[12,"Egypt", false, -31]]
  end  
  
  it 'should parse simple request with <struct> values' do
    xml_request = %{
      <?xml version="1.0"?>
      <methodCall>
         <methodName>examples.getStateName</methodName>
            <params>
              <param>
                <value>
                  <struct>
                    <member>
                     <name>lowerBound</name>
                     <value><i4>18</i4></value>
                    </member>
                    <member>
                     <name>upperBound</name>
                     <value><i4>139</i4></value>
                   </member>
                  </struct>
                </value>
              </param>
            </params>
      </methodCall>
    }

    request = OXMLRPC::Parser.parse(xml_request)
    
    request.rpc_method.should eq "examples.getStateName"
    request.params.should eq [{"lowerBound" => 18, "upperBound" => 139}]
  end  

end
