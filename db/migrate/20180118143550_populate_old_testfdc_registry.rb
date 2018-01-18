class PopulateOldTestfdcRegistry < ActiveRecord::Migration[5.0]
  def up
    # Notes from Dave's 2007 registry
    note_1 = TestfdcNote.create(:number => 1, :description => 'Supports only A: floppy drive (no B: select available)')
    note_2 = TestfdcNote.create(:number => 2, :description => 'Fails even the DD tests (possibly non-standard FDC)')

    # Main results section from Dave's 2007 registry
    TestfdcResult.create(:manufacturer => 'Abit',        :model => 'KT7A',                    :fdc_chip => '?',               :hardware_class => 'Ath',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Abit',        :model => 'TX-5IB2',                 :fdc_chip => 'M5135',           :hardware_class => 'P1',      :result_string => 'PPP PPP PPP').approve!
    TestfdcResult.create(:manufacturer => 'Abit',        :model => 'KV8PRO',                  :fdc_chip => 'W83627HF',        :hardware_class => 'Ath',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Abit',        :model => 'KV80',                    :fdc_chip => 'W83627HF',        :hardware_class => 'Ath',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Adaptec',     :model => 'AHA-1522A',               :fdc_chip => 'DP8473AV',        :hardware_class => 'ISA',     :result_string => 'PPP PPP PPP').approve!
    TestfdcResult.create(:manufacturer => 'Adaptec',     :model => 'AHA-1542B',               :fdc_chip => 'DP8473AC',        :hardware_class => 'ISA',     :result_string => 'PPP NNN NNN').approve!
    TestfdcResult.create(:manufacturer => 'Adaptec',     :model => 'AHA-1542CF',              :fdc_chip => '820778L',         :hardware_class => 'ISA',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Aopen',       :model => 'AP5T',                    :fdc_chip => 'SMC FDC37C669',   :hardware_class => 'P1',      :result_string => 'PPF FPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Aopen',       :model => 'AP5VM',                   :fdc_chip => 'SMC FDC37C669',   :hardware_class => 'P1',      :result_string => 'PPF FPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Aopen',       :model => 'AX63PRO',                 :fdc_chip => 'W83977',          :hardware_class => 'P3',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Aopen',       :model => 'AX6LC',                   :fdc_chip => 'W83977',          :hardware_class => 'P2',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Aopen',       :model => 'MK33',                    :fdc_chip => '?',               :hardware_class => 'Ath',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'ASrock',      :model => 'ALive-SATA2-GLAN',        :fdc_chip => 'K8T890 CF',       :hardware_class => 'Ath64X2', :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'A7V8X',                   :fdc_chip => '?',               :hardware_class => 'Ath',     :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P2BF Rev.1.0',            :fdc_chip => 'W839771FAW',      :hardware_class => '?' ,      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P3B-F',                   :fdc_chip => 'W83977EF',        :hardware_class => 'P3',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P55TVP4',                 :fdc_chip => 'W83877F',         :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P4P800 Deluxe',           :fdc_chip => 'i865PE',          :hardware_class => 'P4',      :result_string => 'PPF NNN PPF', :note => note_1).approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P3B-F',                   :fdc_chip => 'W93977EF',        :hardware_class => 'P3',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P2B-F',                   :fdc_chip => 'W93977EF',        :hardware_class => 'P3',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'P2B-DS',                  :fdc_chip => 'W83977TF',        :hardware_class => 'P3',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Asus',        :model => 'K7V',                     :fdc_chip => 'VIA82C686',       :hardware_class => 'Ath',     :result_string => 'PPF PPF FFF').approve!
    TestfdcResult.create(:manufacturer => 'Compaq',      :model => 'Presario 4100CA',         :fdc_chip => 'SMC LP47U332',    :hardware_class => 'P2',      :result_string => 'PPF FFF PPF', :note => note_1).approve!
    TestfdcResult.create(:manufacturer => 'Compaq',      :model => 'Prolinia 4/33',           :fdc_chip => '?',               :hardware_class => '486',     :result_string => 'PPF NNN PPF').approve!
    TestfdcResult.create(:manufacturer => 'DataExpert',  :model => 'EXP8551',                 :fdc_chip => 'W83787',          :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'DataExpert',  :model => 'EXP8661',                 :fdc_chip => 'W83787',          :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Dell',        :model => 'System 425s',             :fdc_chip => '?',               :hardware_class => '486',     :result_string => 'FFF FFF FFF', :note => note_2).approve!
    TestfdcResult.create(:manufacturer => 'ECS',         :model => 'P4ITA2',                  :fdc_chip => 'IT8712',          :hardware_class => 'P4',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'ECS',         :model => 'K7S5A',                   :fdc_chip => 'ITE IT8705F',     :hardware_class => 'Ath',     :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Gigabyte',    :model => 'GA-586AP',                :fdc_chip => 'UM8663',          :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Gigabyte',    :model => 'GA-586HX Rev 1.56',       :fdc_chip => 'W83877',          :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'GLOBALGROUP', :model => 'Crusader TX C587-1.1',    :fdc_chip => 'M5135',           :hardware_class => '?' ,      :result_string => 'PPP PPP PPP').approve!
    TestfdcResult.create(:manufacturer => 'GMB',         :model => 'P6LIAK',                  :fdc_chip => 'FDC37M672',       :hardware_class => 'P2',      :result_string => 'PPF FPF PPF') .approve!
    TestfdcResult.create(:manufacturer => 'HP',          :model => 'Vectra 45945A',           :fdc_chip => 'i8272',           :hardware_class => '80286',   :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'HP',          :model => 'Vectra VL400DT',          :fdc_chip => '?',               :hardware_class => 'P3',      :result_string => 'PPP NNN PPP').approve!
    TestfdcResult.create(:manufacturer => 'HP',          :model => 'Vectra VE series2 5/xxx', :fdc_chip => 'NS306',           :hardware_class => '?' ,      :result_string => 'PPP PPP PPP').approve!
    TestfdcResult.create(:manufacturer => 'IBM',         :model => 'Pro300A_AFP',             :fdc_chip => 'W83627',          :hardware_class => 'P3',      :result_string => 'PPF NNN PPF', :note => note_1).approve!
    TestfdcResult.create(:manufacturer => 'IBM',         :model => 'PS/2 50 (8550-021)',      :fdc_chip => 'i8272',           :hardware_class => '80286',   :result_string => 'FPF NNN FPF').approve!
    TestfdcResult.create(:manufacturer => 'IBM',         :model => '658695T',                 :fdc_chip => 'PC87306',         :hardware_class => 'P1',      :result_string => 'PPP PPP PPP').approve!
    TestfdcResult.create(:manufacturer => 'Intel',       :model => 'SE440BX2',                :fdc_chip => 'FDC37M707',       :hardware_class => 'P3',      :result_string => 'PPF FPF PPF', :note => note_1).approve!
    TestfdcResult.create(:manufacturer => 'Intel',       :model => 'D815EEA2',                :fdc_chip => '?',               :hardware_class => 'P3',      :result_string => 'PPF NNN PPF', :note => note_1).approve!
    TestfdcResult.create(:manufacturer => 'Mercury',     :model => 'KM266PM-U',               :fdc_chip => '?',               :hardware_class => 'Ath',     :result_string => 'FPF NNN FPF').approve!
    TestfdcResult.create(:manufacturer => 'QDI',         :model => 'P51430VX-250 ExplorerII', :fdc_chip => 'NS PC87306',      :hardware_class => 'P1',      :result_string => 'PPP PPP PPP').approve!
    TestfdcResult.create(:manufacturer => 'Shuttle',     :model => 'HOT-591P',                :fdc_chip => 'IT8679F',         :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'TMC',         :model => 'TI6NB-2.20',              :fdc_chip => 'W83977',          :hardware_class => 'P2',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'TRITON',      :model => 'P54C',                    :fdc_chip => 'W83787F',         :hardware_class => 'P1',      :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'TYAN',        :model => '5239001',                 :fdc_chip => '?',               :hardware_class => 'Ath',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'TYAN',        :model => 'PC87351IBW',              :fdc_chip => '?',               :hardware_class => 'P3',      :result_string => 'PPP PPP PPP').approve!

    # Incomplete information from Dave's 2007 registry
    TestfdcResult.create(:manufacturer => '?',           :model => 'AI5TH-1.00',              :fdc_chip => 'SMC FDC37C6651',  :hardware_class => 'P2',      :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => '?',           :model => 'GW2760PX',                :fdc_chip => 'Prime2',          :hardware_class => 'ISA',     :result_string => 'PPF PPF PPF').approve!
    TestfdcResult.create(:manufacturer => '?',           :model => 'UM8810PAIO rev 2.1',      :fdc_chip => 'SMC FDC36C665GT', :hardware_class => '486',     :result_string => 'PPF FPF PPF').approve!
    TestfdcResult.create(:manufacturer => '?',           :model => '?',                       :fdc_chip => 'UM82C863F/865F',  :hardware_class => 'ISA',     :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Acer',                                             :fdc_chip => 'M5105',           :hardware_class => '?',       :result_string => 'PPP NPN PPN').approve!
    TestfdcResult.create(:manufacturer => 'Intel',                                            :fdc_chip => 'I82072',          :hardware_class => '?',       :result_string => 'PPF NPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Intel',                                            :fdc_chip => 'I82077',          :hardware_class => '?',       :result_string => 'FPF FPF FPF').approve!
    TestfdcResult.create(:manufacturer => 'Nat.Semi.',                                        :fdc_chip => 'DP8473',          :hardware_class => '?',       :result_string => 'PPP NPN PPN').approve!
    TestfdcResult.create(:manufacturer => 'SMC',                                              :fdc_chip => 'Super I/O',       :hardware_class => '?',       :result_string => 'PPF NPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'WD',                                               :fdc_chip => 'WD37C65',         :hardware_class => '?',       :result_string => 'PPF NPF PPF').approve!
    TestfdcResult.create(:manufacturer => 'Winbond',                                          :fdc_chip => 'W83757',          :hardware_class => '?',       :result_string => 'FPF FPF FPF').approve!    
  end

  def down
    execute 'TRUNCATE TABLE `testfdc_results`'
    execute 'TRUNCATE TABLE `testfdc_notes`'
  end
end
