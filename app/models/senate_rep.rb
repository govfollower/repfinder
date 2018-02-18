class SenateRep < ApplicationRecord
  belongs_to :state

  def as_representative
    {
      id: id,
      first_name: first_name,
      middle_name: middle_name,
      last_name: last_name,
      gender: gender,
      dob: dob,
      party: party,
      phone: phone,
      website_url: website_url,
      contact_form_url: contact_form_url,
      facebook_account: facebook_account,
      twitter_account: twitter_account,
      reelection_year: reelection_year
    }
  end
end
