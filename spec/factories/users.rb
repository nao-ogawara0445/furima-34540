FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'123abc'}
    password_confirmation {password}
    family_name           {'苗字'}
    first_name            {'名前'}
    family_name_furi      {'ミョウジ'}
    first_name_furi       {'ナマエ'}
    birthday        {'1930-02-02'}
  end
end