require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'reek/method_checker'
require 'reek/report'

include Reek

describe MethodChecker, "uncommunicative method name" do

  before(:each) do
    @rpt = Report.new
    @cchk = MethodChecker.new(@rpt, 'Thing')
  end

  it 'should not report one-word method name' do
    @cchk.check_source('def help(fred) basics(17) end')
    @rpt.should be_empty
  end

  it 'should report one-letter method name' do
    @cchk.check_source('def x(fred) basics(17) end')
    @rpt.length.should == 1
    @rpt[0].detailed_report.should match(/x/)
    @rpt[0].detailed_report.should match(/method name/)
  end
end

describe MethodChecker, "uncommunicative field name" do

  before(:each) do
    @rpt = Report.new
    @cchk = MethodChecker.new(@rpt, 'Thing')
  end

  it 'should not report one-word field name' do
    @cchk.check_source('def help(fred) @simple end')
    @rpt.should be_empty
  end

  it 'should report one-letter fieldname' do
    @cchk.check_source('def simple(fred) @x end')
    @rpt.length.should == 1
    @rpt[0].detailed_report.should match(/@x/)
    @rpt[0].detailed_report.should match(/field name/)
  end
end

describe MethodChecker, "uncommunicative local variable name" do

  before(:each) do
    @rpt = Report.new
    @cchk = MethodChecker.new(@rpt, 'Thing')
  end

  it 'should not report one-word variable name' do
    @cchk.check_source('def help(fred) simple = jim(45) end')
    @rpt.should be_empty
  end

  it 'should report one-letter variable name' do
    @cchk.check_source('def simple(fred) x = jim(45) end')
    @rpt.length.should == 1
    @rpt[0].detailed_report.should match(/x/)
    @rpt[0].detailed_report.should match(/local variable name/)
  end

  it 'should report variable name only once' do
    @cchk.check_source('def simple(fred) x = jim(45); x = y end')
    @rpt.length.should == 1
  end
end

describe MethodChecker, "uncommunicative parameter name" do

  before(:each) do
    @rpt = Report.new
    @cchk = MethodChecker.new(@rpt, 'Thing')
  end

  it 'should recognise short parameter name' do
    @cchk.check_source('def help(x) basics(17) end')
    @rpt.length.should == 1
    @rpt[0].name.should == 'Uncommunicative Name'
  end

  it 'should not recognise *' do
    @cchk.check_source('def help(xray, *) basics(17) end')
    @rpt.length.should == 0
  end

  it "should report parameter's name" do
    @cchk.check_source('def help(x) basics(17) end')
    @rpt[0].detailed_report.should match(/x/)
    @rpt[0].detailed_report.should match(/parameter name/)
  end
end

describe UncommunicativeName, '#report' do
  it 'should report the bad symbol name' do
    mchk = MethodChecker.new([], 'Class')
    smell = UncommunicativeName.new(mchk, 'thing')
    smell.recognise?(:x).should == true
    smell.report.should match(/x/)
    smell.report.should_not match(/:x/)
  end
end
