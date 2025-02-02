# Topic.where(name: 'losartan')[0].id

FactoryBot.define do
  factory :medication do
    patient
    topic_id 40
    current true
    name 'losartan'
    common_name 'COZAAR'
    dose 30.0
    dose_unit_of_measurement 'mg'
    dosage_form 'tablet'

    ingestion_method 'take 30 mg by mouth 2 times a day'
  end
end
