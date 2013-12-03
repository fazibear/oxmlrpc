require_relative 'spec_helper'

describe OXMLRPC::Serializer do
  it 'should serialize <int> value' do
    OXMLRPC::Serializer.serialize(12).chomp
      .should eq "<methodResponse><params><param><value><int>12</int></value></param></params></methodResponse>"
  end
  
  it 'should serialize <string> value' do
    OXMLRPC::Serializer.serialize("hello").chomp
      .should eq "<methodResponse><params><param><value>hello</value></param></params></methodResponse>"
  end
  
  it 'should serialize <boolean> value' do
    OXMLRPC::Serializer.serialize(true).chomp
      .should eq "<methodResponse><params><param><value><boolean>1</boolean></value></param></params></methodResponse>"
  end
  
  it 'should serialize <double> value' do
    OXMLRPC::Serializer.serialize(-12.45).chomp
      .should eq "<methodResponse><params><param><value><double>-12.45</double></value></param></params></methodResponse>"
  end

  it 'should serialize <dateTime.iso8601> value' do
    OXMLRPC::Serializer.serialize(Time.parse("19980717T14:08:55")).chomp
      .should eq "<methodResponse><params><param><value><dateTime.iso8601>19980717T14:08:55</dateTime.iso8601></value></param></params></methodResponse>"
  end
  
  it 'should serialize <struct> value' do
    OXMLRPC::Serializer.serialize({:x => 2, :y => "z"}).chomp
      .should eq "<methodResponse><params><param><value><struct><member><name>x</name><value><int>2</int></value></member><member><name>y</name><value>z</value></member></struct></value></param></params></methodResponse>"
  end
  
  it 'should serialize <array> value' do
    OXMLRPC::Serializer.serialize([12, "test"]).chomp
      .should eq "<methodResponse><params><param><value><array><data><value><int>12</int></value><value>test</value></data></array></value></param></params></methodResponse>"
  end
  
  it 'should serialize <exception> value' do
    pending
    OXMLRPC::Serializer.serialize(StandardError.new("something wrong")).chomp
      .should eq ""
  end

end


