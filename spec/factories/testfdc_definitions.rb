FactoryBot.define do

  factory :empty_testfdc_result, :class => :testfdc_result do
  end

  factory :testfdc_result do
    manufacturer { 'Glitch Works, LLC' }
    sequence(:model) { |n| "GW-FDC-#{n}"} 
    fdc_chip { 'Foochip 6000' }
    hardware_class { 'ISA' }
    approved { false }
  end
 
  factory :approved_testfdc_result, :parent => :testfdc_result do
    approved { true }
  end
end