FactoryBot.define do

  factory :empty_testfdc_result, :class => :testfdc_result do
  end

  factory :testfdc_result do
    manufacturer { 'Glitch Works' }
    sequence(:model) { |n| "GW-FDC-#{n}"} 
    fdc_chip { 'Foochip 6000' }
    hardware_class { 'ISA' }
    approved { nil }
    fm_250 { true }
    fm_300 { true }
    fm_500 { true }
    mfm_250 { false }
    mfm_300 { false }
    mfm_500 { false }

    trait :approved do
      approved { true }
    end
  end
  
end
