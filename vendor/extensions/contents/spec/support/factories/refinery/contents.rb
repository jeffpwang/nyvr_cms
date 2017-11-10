
FactoryGirl.define do
  factory :content, :class => Refinery::Contents::Content do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

